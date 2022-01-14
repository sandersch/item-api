class ArmorController < ApplicationController
  before_action :set_armor, only: [:show, :update, :destroy]

  # GET /armors
  def index
    @armors = detailed_armors

    render jsonapi: @armors,
           class: { "Item": SerializableArmor }
  end

  # GET /armors/1
  def show
    render jsonapi: @armor,
           class: { "Item": SerializableArmor }
  end

  # POST /armors
  def create
    @armor = Armor.new(armor_params)

    if @armor.save
      render json: @armor, status: :created, location: @armor
    else
      render json: @armor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /armors/1
  def update
    if @armor.update(armor_params)
      render json: @armor
    else
      render json: @armor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /armors/1
  def destroy
    @armor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_armor
      @armor = detailed_armors.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def armor_params
      params.fetch(:armor, {})
    end

    def detailed_armors
      @armors = Item.where(details_type: "Armor")
        .includes(
          { bane: :property },
          :enhancive,
          :enhancive_properties,
          :resistances,
          details: :item_property
        )
    end
end
