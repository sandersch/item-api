class SerializableEnhanciveProperty < JSONAPI::Serializable::Resource
  type 'enhancive_properties'
  attribute :kind
  attribute :amount
  attribute :minimum_level
  attribute :created_at
  attribute :updated_at
  has_one :item
end
