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

haubergeon = Item.create!(
  details: ArmorDetail.create!(
    item_property: nil,
    armor_base: ArmorBase.find(16),
    enchant: 45,
    ensorcell: 5,
    sanctify: 0,
  ),
  weight: 12,
  noun: "haubergeon",
  name: "gleaming vultite haubergeon",
)

leather = Item.create!(
  details: ArmorDetail.create!(
    item_property: nil,
    armor_base: ArmorBase.find(8),
    enchant: 50,
    ensorcell: 1,
    sanctify: 0,
  ),
  weight: 8,
  noun: "leather",
  name: "some cerulean double leather",
)
