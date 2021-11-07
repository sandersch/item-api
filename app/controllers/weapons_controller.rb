class WeaponsController < ApplicationController
  before_action :set_weapon_detail, only: [:show, :update, :destroy]

  # GET /weapon_details
  def index
    @weapon_details = WeaponDetail.all

    render json: @weapon_details
  end

  # GET /weapon_details/1
  def show
    render json: @weapon_detail
  end

  # POST /weapon_details
  def create
    @weapon_detail = WeaponDetail.new(weapon_detail_params)

    if @weapon_detail.save
      render json: @weapon_detail, status: :created, location: @weapon_detail
    else
      render json: @weapon_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /weapon_details/1
  def update
    if @weapon_detail.update(weapon_detail_params)
      render json: @weapon_detail
    else
      render json: @weapon_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /weapon_details/1
  def destroy
    @weapon_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weapon_detail
      @weapon_detail = WeaponDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def weapon_detail_params
      params.require(:weapon_detail).permit(:weapon_base_id, :forage_quality, :item_id)
    end
end
