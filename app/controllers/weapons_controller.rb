class WeaponsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]

  # GET /weapons
  def index
    render jsonapi: detailed_items,
           class: { "Item": item_serializer }
  end

  # GET /weapons/1
  def show
    render jsonapi: @item,
           class: { "Item": item_serializer }
  end

  # POST /weapons
  def create
    @weapon = Weapon.new(weapon_params)

    if @weapon.save
      render json: @weapon, status: :created, location: @weapon
    else
      render json: @weapon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /weapons/1
  def update
    if @weapon.update(weapon_params)
      render json: @weapon
    else
      render json: @weapon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /weapons/1
  def destroy
    @weapon.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weapon
      @weapon = Weapon.find(params[:id])
    end

    def set_item
      @item = detailed_items.find(params[:id])
    end

    def item_class
      Weapon
    end

    def item_serializer
      "Serializable#{item_class}".constantize
    end

    # Only allow a list of trusted parameters through.
    def weapon_params
      params.require(:weapon).permit(:weapon_base_id, :forge_quality, :item_id)
    end

    def detailed_items
      @items = Item.where(details_type: item_class.to_s)
        .includes(
          { bane: :property },
          :enhancive,
          :enhancive_properties,
          :resistances,
          details: :item_property
        )
    end
end
