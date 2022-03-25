class DetailedItemController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]

  def index
    render jsonapi: detailed_items,
           class: { "Item": item_serializer }
  end

  def show
    render jsonapi: @item,
           class: { "Item": item_serializer }
  end

  protected

  def item_class
    raise NotImplementedError
  end

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
