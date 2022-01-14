class SerializableCombatItem < JSONAPI::Serializable::Resource
  extend JSONAPI::Serializable::Resource::ConditionalFields

  attribute :name
  attribute :noun
  attribute :weight
  attribute :material

  attribute :primary_property, if: Proc.new { @object.details.item_property } do
    @object.details.item_property.slice(:effect, :kind, :amount).compact
  end

  attribute :enchant do
   @object.details.enchant
  end
  attribute :ensorcell, if: Proc.new { @object.details.ensorcell } do
    @object.details.ensorcell
  end
  attribute :sanctify, if: Proc.new { @object.details.sanctify } do
    @object.details.sanctify
  end
  attribute :critical_services do
    @object.details.critical_services
  end
  attribute :damage_services do
    @object.details.damage_services
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

  attribute :long_description, if: Proc.new { @object.long_description }
  attribute :show_description, if: Proc.new { @object.show_description }
  attribute :created_at
  attribute :updated_at
end
