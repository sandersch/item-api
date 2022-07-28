class DetailedItemController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]

  def index
    render jsonapi: detailed_items, class: jsonapi_serializer_map
  end

  def show
    render jsonapi: @item, class: jsonapi_serializer_map
  end

  def jsonapi_serializer_map
    {
      "Item": item_serializer,
    }
  end

  protected

  def item_class
    raise NotImplementedError
  end

  def set_item
    @item = item_scope.find(params[:id])
  end

  def item_scope
    Item.where(query_parameters)
      .includes(
        { bane: :property },
        :enhancive,
        :enhancive_properties,
        :resistances,
        details: :item_property
      )
  end

  def item_serializer
    "Serializable#{item_class}".constantize
  end

  def query_parameters
    {
      details_type: item_class.to_s
    }
  end

  def detailed_items
    @items = item_scope.all
  end
end
