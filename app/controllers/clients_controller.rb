class ClientsController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  before_action :set_client, except: [:new, :create, :index]
  before_action :set_category, only: [:new, :edit, :update, :index]
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
      params.require(:client).permit(:first_name, :last_name, :email, :category_id)
    end
end
