class SerializableResistance < JSONAPI::Serializable::Resource
  type 'resistances'
  attribute :kind
  attribute :amount
  attribute :temporary
  attribute :created_at
  attribute :updated_at
  has_one :item
end
