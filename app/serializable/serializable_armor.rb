class SerializableArmor < SerializableCombatItem
  type 'armor'

  attribute :asg do
    @object.details.armor_base_id
  end
  attribute :resistances do
    @object.resistances.map { |r| r.slice(:kind, :amount, :temporary).compact }
  end
end
