# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
[
  { id:  1, group: 1, name: "Normal Clothing",        weight:  0, rt:  0, ap:   0, cva:  20 },
  { id:  2, group: 1, name: "Robes",                  weight:  8, rt:  0, ap:   0, cva:  15 },

  { id:  5, group: 2, name: "Light Leather",          weight: 10, rt:  0, ap:   0, cva:  15 },
  { id:  6, group: 2, name: "Full Leather",           weight: 13, rt:  1, ap:  -1, cva:  14 },
  { id:  7, group: 2, name: "Reinforced Leather",     weight: 15, rt:  2, ap:  -5, cva:  13 },
  { id:  8, group: 2, name: "Double Leather",         weight: 16, rt:  2, ap:  -6, cva:  12 },

  { id:  9, group: 3, name: "Leather Breastplate",    weight: 16, rt:  3, ap:  -7, cva:   5 },
  { id: 10, group: 3, name: "Cuirbouilli Leather",    weight: 17, rt:  4, ap:  -8, cva:   4 },
  { id: 11, group: 3, name: "Studded Leather",        weight: 20, rt:  5, ap: -10, cva:   3 },
  { id: 12, group: 3, name: "Brigandine Armor",       weight: 25, rt:  6, ap: -12, cva:   2 },

  { id: 13, group: 4, name: "Chain Mail",             weight: 25, rt:  7, ap: -13, cva:  -6 },
  { id: 14, group: 4, name: "Double Chain",           weight: 25, rt:  8, ap: -14, cva:  -7 },
  { id: 15, group: 4, name: "Augmented Chain",        weight: 26, rt:  8, ap: -16, cva:  -8 },
  { id: 16, group: 4, name: "Chain Hauberk",          weight: 27, rt:  9, ap: -18, cva:  -9 },

  { id: 17, group: 5, name: "Metal Breastplate",      weight: 23, rt:  9, ap: -20, cva: -18 },
  { id: 18, group: 5, name: "Augmented Breastplate",  weight: 25, rt: 10, ap: -25, cva: -19 },
  { id: 19, group: 5, name: "Half Plate",             weight: 50, rt: 11, ap: -30, cva: -20 },
  { id: 20, group: 5, name: "Full Plate",             weight: 75, rt: 12, ap: -35, cva: -21 },
].each do |attrs|
  base = ArmorBase.where(id: attrs[:id]).first_or_initialize
  base.update!(attrs)
end

[
  { name: "dagger",     category: "edged",      base_speed: 1, minimum_speed: 3, weight: 1  },
  { name: "lance",      category: "polearm",    base_speed: 9, minimum_speed: 5, weight: 15 },
  { name: "runestaff",  category: "runestaff",  base_speed: 6, minimum_speed: 5, weight: 15 },
].each do |attrs|
  base = WeaponBase.find_or_initialize_by(name: attrs[:name])
  base.update!(attrs)
end

Item.find_or_initialize_by(name: "gleaming silvery vultite haubergeon").tap do |item|
  klass = ArmorDetail
  item.details ||= klass.new(
    armor_base_id: 15,
    enchant: 45,
    ensorcell: 5,
    critical_services: 340,
    damage_services: 150,
    item_property: ItemProperty.new(effect: "flare", kind: "grapple")
  )
  item.update!(
    weight: 13,
    noun: "haubergeon",
  )
end

Item.find_or_initialize_by(name: "some faded cerulean leathers").tap do |item|
  klass = ArmorDetail
  item.details ||= klass.new(
    item_property: nil,
    armor_base_id: 8,
    enchant: 50,
    ensorcell: 0,
    critical_services: 370,
  )
  item.update!(
    weight: 8,
    noun: "leather",
  )
end


Item.find_or_initialize_by(name: "perfect mithril lance").tap do |item|
  klass = WeaponDetail
  item.details ||= klass.create!(
    weapon_base: WeaponBase.find_by(name: "lance"),
    item_property: ItemProperty.new(effect: "flare", kind: "dispel", amount: 2),
    enchant: 50,
    ensorcell: 5,
    critical_services: 160,
    forge_quality: "perfect",
    sanctify: 5,
  )
  item.update!(
    weight: 8,
    noun: "lance",
  )
end

Item.find_or_initialize_by(name: "marred runestaff").tap do |item|
  klass = WeaponDetail
  item.details ||= klass.new(
    weapon_base: WeaponBase.find_by(name: "runestaff"),
    enchant: 35,
    ensorcell: 4,
  ).tap do |d| 
  end
  item.details.build_item_property(effect: "flare", kind: "acuity", amount: 7)
  item.details.save!
  item.update!(
    weight: 4,
    loresong_unlocked: true,
  )
end
