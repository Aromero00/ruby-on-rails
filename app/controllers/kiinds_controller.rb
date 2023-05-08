class KiindsController < ApplicationController
  before_action :set_kiind, only: %i[ show update destroy ]
include ActionController::HttpAuthentication::Basic::ControllerMethods 
 http_basic_authenticate_with name: "antonio", password: "123456"


  # GET /kiinds
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
end
