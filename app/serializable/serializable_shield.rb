class SerializableShield < SerializableCombatItem
  type 'shield'

  attribute :size do
    @object.details.size
  end

  attribute :resistances do
    @object.resistances.map { |r| r.slice(:kind, :amount, :temporary).compact }
  end
end
