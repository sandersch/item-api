class SerializableItem < JSONAPI::Serializable::Resource
  type 'items'
  attribute :details_type
  attribute :weight
  attribute :noun
  attribute :name
  attribute :long_description
  attribute :show_description
  attribute :loresong_unlocked
  attribute :created_at
  attribute :updated_at
  attribute :material
  has_one :enhancive
  has_one :bane
  has_one :imbed
  has_one :details
  has_many :resistances
  has_many :enhancive_properties
end
