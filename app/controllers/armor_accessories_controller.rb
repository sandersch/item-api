class ArmorAccessoriesController < ApplicationController
  before_action :set_armor_accessory, only: [:show, :update, :destroy]

  # GET /armor_accessories
  def index
    @armor_accessories = ArmorAccessory.all

    render json: @armor_accessories
  end

  # GET /armor_accessories/1
  def show
    render json: @armor_accessory
  end

  # POST /armor_accessories
  def create
    @armor_accessory = ArmorAccessory.new(armor_accessory_params)

    if @armor_accessory.save
      render json: @armor_accessory, status: :created, location: @armor_accessory
    else
      render json: @armor_accessory.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /armor_accessories/1
  def update
    if @armor_accessory.update(armor_accessory_params)
      render json: @armor_accessory
    else
      render json: @armor_accessory.errors, status: :unprocessable_entity
    end
  end

  # DELETE /armor_accessories/1
  def destroy
    @armor_accessory.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_armor_accessory
      @armor_accessory = ArmorAccessory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def armor_accessory_params
      params.require(:armor_accessory).permit(:kind)
    end
end
