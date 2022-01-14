class ShieldsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]

  def item_class
    Shield
  end

  # GET /shields
  def index
    render jsonapi: detailed_items,
           class: { "Item": item_serializer }
  end

  # GET /shields/1
  def show
    render jsonapi: @item,
           class: { "Item": item_serializer }
  end

  # POST /shields
  def create
    @shield = Shield.new(shield_params)

    if @shield.save
      render json: @shield, status: :created, location: @shield
    else
      render json: @shield.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shields/1
  def update
    if @shield.update(shield_params)
      render json: @shield
    else
      render json: @shield.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shields/1
  def destroy
    @shield.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_shield
      #@shield = Shield.find(params[:id])
    #end

    ## Only allow a list of trusted parameters through.
    #def shield_params
      #params.require(:shield).permit(:size)
    #end

    def set_item
      @item = detailed_items.find(params[:id])
    end

    def item_serializer
      "Serializable#{item_class}".constantize
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
