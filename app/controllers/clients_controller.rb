class ClientsController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  before_action :set_client, except: [:new, :create, :index, :search]
  before_action :set_category, only: [:new, :edit, :update, :index, :search]
  before_action :is_authorised, only: [:edit, :update, :destroy]

  def new
    @client = current_user.clients.build
  end

  def create
    @client = current_user.clients.build(client_params)
    if @client.save
      redirect_to clients_path, notice: "#{@client.first_name} has been added successfully"
    else
      # for dev mode to show all errors.
      redirect_to request.referrer, flash: { error: @client.errors.full_messages }
    end
  end

  def edit
  end

  def update
    if @client.update(client_params)
      flash[:notice] = "#{@client.first_name} has been updated successfully..."
    else
      flash[:alert] = "Hmmm...can not process this action."
    end
    redirect_to request.referrer
  end

  def show
  end

  def index
    @client = Client.order(:created_at)
  end

  def destroy
    @client.destroy
    redirect_to clients_path, notice: "Your client has been deleted successfully."
  end

  def search
    # In case no categories are provided, make it nil
    @category = Category.find(params[:category]) if params[:category].present?

    # get all clients in db with templated condition, and compare it to arguements passed in the url
    #@clients = Client.where("active = ? AND clients.first_name ILIKE ? AND category_id = ?", true, "%#{params[:f]}%", params[:category]) 

    # Refactoring code based on https://apidock.com/rails/ActiveRecord/QueryMethods/where
    @s = params[:s]

    search_condition = []
    search_condition[0] = "clients.active = true"

    # first condition - the first value, index 0 of the array will be a template, and second will check if @s is not blank and add search_condition into index 0, then push and create another value in the array
    if !@s.blank?
      search_condition[0] += ' AND clients.first_name ILIKE ?'
      search_condition.push "#{@s}"
      # keep adding elements into the array
    end
    
    # second condition
    if !params[:category].blank?
      search_condition[0] += ' AND category_id = ?'
      search_condition.push params[:category]
      # keep adding elements into the array, to create the third value in the array.
    end

    @clients = Client.where(search_condition)


  end

 
  private
    def set_client
      @client = Client.find(params[:id])
    end

    def set_category
      @categories = Category.all
    end

    def is_authorised
      redirect_to root_path, alert: "Hmm..not authorized for this action" unless current_user.id == @client.user_id
    end

    def client_params
      params.require(:client).permit(:first_name, :last_name, :email, :active, :revenue, :category_id)
    end
end
