class KiindsController < ApplicationController
  before_action :set_kiind, only: %i[ show update destroy ]
#include ActionController::HttpAuthentication::Basic::ControllerMethods 
 #http_basic_authenticate_with name: "antonio", password: "123456"

# include ActionController::HttpAuthentication::Digest::ControllerMethods
 #USERS = {"antonio" => OpenSSL::Digest::MD5.hexdigest(["antonio","application","secret"].join(":"))}  #ha1 digest password
  # GET /kiinds

  include ActionController::HttpAuthentication::Token::ControllerMethods

  TOKEN = "secret123"

  before_action :authenticate
  
  
  def index
    @kiinds = Kiind.all

    render json: @kiinds
  end

  # GET /kiinds/1
  def show
    render json: @kiind
  end

  # POST /kiinds
  def create
    @kiind = Kiind.new(kiind_params)

    if @kiind.save
      render json: @kiind, status: :created, location: @kiind
    else
      render json: @kiind.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /kiinds/1
  def update
    if @kiind.update(kiind_params)
      render json: @kiind
    else
      render json: @kiind.errors, status: :unprocessable_entity
    end
  end

  # DELETE /kiinds/1
  def destroy
    @kiind.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kiind
      @kiind = Kiind.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kiind_params
      params.require(:kiind).permit(:description)
    end

    #def authenticate
      #authenticate_or_request_with_http_digest("application") do |username|
      #  USERS[username]
      #end
    #end

    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        # Compare the tokens in a time-constant manner, to mitigate
        # timing attacks.
        ActiveSupport::SecurityUtils.secure_compare(token, TOKEN)
      end
    end


end
