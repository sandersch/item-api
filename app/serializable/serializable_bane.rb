class SerializableBane < JSONAPI::Serializable::Resource
  type 'banes'
  attribute :against
  attribute :effect do
    @object.property.effect
  end
  attribute :kind do
    @object.property.kind
  end
  attribute :amount do
    @object.property.amount
  end
  has_one :item
end
