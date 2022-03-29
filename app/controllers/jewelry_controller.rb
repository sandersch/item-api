class JewelryController < DetailedItemController
  def item_class
    BasicItem
  end

  def detailed_items
    item_scope.map(&:item)
  end

  def item_scope
    BasicItem.joins(:item).where(kind: item_kind)
      .includes(:item => [
        { bane: :property },
        :enhancive,
        :enhancive_properties,
        :resistances,
        details: :item_property
    ])
  end

  def set_item
    @item = item_scope.find_by('item.id' => params[:id]).item
  end

  def item_kind
    "jewelry"
  end
end
