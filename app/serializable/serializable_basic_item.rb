class SerializableBasicItem < JSONAPI::Serializable::Resource
  extend JSONAPI::Serializable::Resource::ConditionalFields

  type :basic_item

  attribute :name
  attribute :noun
  attribute :weight
  attribute :material
  attribute :kind do
    @object.details.kind
  end
  attribute :worn do
    @object.details.worn
  end
  attribute :capacity, if: Proc.new { @object.details&.capacity } do
    @object.details.capacity.to_i
  end

  attribute :loresong_unlocked
  attribute :enhancive, if: Proc.new { @object.enhancive } do
    {
      persists: @object.enhancive.persists?,
      rechargeable: @object.enhancive.rechargeable?,
      properties: @object.enhancive_properties.map do |prop|
        {
          kind: prop.kind,
          amount: prop.amount,
        }.tap do |h|
          prop.minimum_level &&
            h[:minimum_level] = prop.minimum_level
        end
      end
    }
  end
  attribute :bane, if: Proc.new { @object.bane } do
    {
      against: @object.bane.against,
    }.merge(
      @object.bane.property.slice(:effect, :kind, :amount).compact
    )
  end
  attribute :imbed, if: Proc.new { @object.imbed } do
    @object.imbed.slice(
      :spell_number,
      :charges,
      :max_charges,
      :activator,
      :persists,
      :merchant_rechargeable,
      :player_rechargeable,
      :empowerable,
    )
  end

  attribute :long_description, if: Proc.new { @object.long_description }
  attribute :show_description, if: Proc.new { @object.show_description }
  attribute :created_at
  attribute :updated_at
end
