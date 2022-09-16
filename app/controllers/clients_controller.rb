class ClientsController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  before_action :set_client, except: [:new, :create, :destroy]
  before_action :is_authorised, only: [:edit, :update, :destroy]

  def new
    @client = current_user.clients.build
  end

  def create
    @client = current_user.clients.build(client_params)
    if @client.save
      redirect_to edit_client_path(@client), notice: "#{@client.first_name} has been added successfully"
    else
      # for dev mode to show all errors.
      redirect_to request.referrer, flash: { error: @client.errors.full_messages }
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def is_authorised
      redirect_to root_path, alert: "Hmm..not authorized for this action" unless current_user.id == @client.user_id
    end

    def client_params
      params.require(:client).permit(:first_name, :last_name, :email)
    end
end
