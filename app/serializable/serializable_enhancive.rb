class SerializableEnhancive < JSONAPI::Serializable::Resource
  type 'enhancives'
  attribute :persists
  attribute :rechargeable
  attribute :properties do
    @object.item.enhancive_properties
  end
  has_one :item
end
