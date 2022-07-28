class ItemsController < ApplicationController
  before_action :set_item, only: [:update, :destroy]

  # GET /items
  def index
    @items = Item.all

    render jsonapi: @items
  end

  # GET /items/1
  def show
    set_item_with_details
    render jsonapi: @item
  end

  # POST /items
  def create
    @item = Item.new(item_params)

    if @item.save
      render json: @item, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    def set_item_with_details
      @item = Item.where(id: params[:id])
        .includes(
          { bane: :item_property },
          :enhancive,
          :enhancive_properties,
          :resistances,
          { details: :item_property }
        ).first
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:details_id, :details_type, :weight, :noun, :name, :long_description, :show_description)
    end
end
