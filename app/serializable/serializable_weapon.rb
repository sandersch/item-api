class SerializableWeapon < SerializableCombatItem
  type 'weapon'

  attribute :forge_quality, if: Proc.new { @object.details.forge_quality } do
    @object.details.forge_quality
  end
  attribute :base do
    @object.details.weapon_base.name
  end
end
