class SerializableArmorAccessory < SerializableCombatItem
  attribute :kind do
    @object.details.kind
  end
  attribute :resistances do
    @object.resistances.map { |r| r.slice(:kind, :amount, :temporary).compact }
  end
end
