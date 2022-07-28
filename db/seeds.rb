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
  klass = Armor
  item.details ||= klass.new(
    armor_base_id: 15,
    enchant: 45,
    ensorcell: 5,
    critical_services: 340,
    damage_services: 150,
    item_property: ItemProperty.new(effect: "flare", kind: "grapple")
  )
  item.resistances.tap do |r|
    r.find_or_initialize_by(kind: "puncture").amount = 40
    r.find_or_initialize_by(kind: "crush").amount    = 25
    r.find_or_initialize_by(kind: "impact").amount   = 10
  end
  item.update!(
    weight: 13,
    noun: "haubergeon",
    material: "vultite",
  )
end

Item.find_or_initialize_by(name: "some faded cerulean leathers").tap do |item|
  klass = Armor
  item.details ||= klass.new(
    item_property: nil,
    armor_base_id: 8,
    enchant: 50,
    ensorcell: 0,
    critical_services: 370,
  )
  item.resistances.tap do |r|
    r.find_or_initialize_by(kind: "slash").amount = 40
    r.find_or_initialize_by(kind: "crush").amount = 20
    r.find_or_initialize_by(kind: "acid").amount  = 10
  end
  item.enhancive ||= Enhancive.new(
    persists: true,
    rechargeable: true
  )
  item.enhancive_properties.tap do |ep|
    ep.find_or_initialize_by(kind: "max_spirit").update(amount: 1, minimum_level: 45)
    ep.find_or_initialize_by(kind: "spirit_recovery").amount = 1
  end
  item.update!(
    weight: 8,
    noun: "leather",
    material: "leather",
  )
end


Item.find_or_initialize_by(name: "perfect mithril lance").tap do |item|
  klass = Weapon
  item.details ||= klass.create!(
    weapon_base: WeaponBase.find_by(name: "lance"),
    item_property: ItemProperty.new(effect: "flare", kind: "dispel", amount: 2),
    enchant: 50,
    ensorcell: 5,
    critical_services: 160,
    forge_quality: "perfect",
    sanctify: 5,
  )
  item.bane ||= item.build_bane(
    against: "undead",
    property: ItemProperty.new(effect: "bonus", kind: "offensive", amount: 10),
  )
  item.update!(
    weight: 8,
    noun: "lance",
    material: "mithril",
  )
  #item.script ||= ItemScript.create!(name: "Bubble Flares")
end

Item.find_or_initialize_by(name: "marred runestaff").tap do |item|
  klass = Weapon
  item.details ||= klass.new(
    weapon_base: WeaponBase.find_by(name: "runestaff"),
    enchant: 35,
    ensorcell: 4,
  ).tap do |d| 
  end
  item.details.save!
  unless item.details.item_property
    item.details.create_item_property(effect: "flare", kind: "acuity", amount: 7)
  end
  item.update!(
    weight: 4,
    noun: "runestaff",
    material: "orase",
    loresong_unlocked: true,
  )
end

Item.find_or_initialize_by(name: "embossed mesille aegis").tap do |item|
  klass = Shield
  item.details ||= klass.new(
    size: "large",
    enchant: 36,
    ensorcell: 5,
    item_property: ItemProperty.new(effect: "bonus", kind: "target_defense", amount: 10)
  )
  item.update!(
    weight: 9,
    material: "mesille",
    noun: "aegis",
  )
end

Item.find_or_initialize_by(name: "silvery imflass arm greaves").tap do |item|
  klass = ArmorAccessory
  item.details ||= klass.new(
    kind: "arm_greaves",
    item_property: ItemProperty.new(effect: "flare", kind: "lightning"),
    critical_services: 10,
    damage_services: 10,
  )
  item.update!(
    weight: 3,
    noun: "greaves",
    material: "imflass",
    long_description: "some silvery imflass arm greaves inset with angular bluish mithril runes",
  )
end

Item.find_or_initialize_by(name: "purple-veined black leather backpack").tap do |item|
  klass = BasicItem
  item.details ||= klass.new(
    worn: "back",
    capacity: 200,
    kind: "container",
  )
  item.update!(
    noun: "backpack",
    material: "leather",
    weight: 4,
  )
  #item.script ||= ItemScript.create!(name: "Black Swan Weight Reduction")
end

Item.find_or_initialize_by(name: "deathstone studded ora armband").tap do |item|
  klass = BasicItem
  item.details ||= klass.new(
    worn: "arm",
    kind: "jewelry",
  )
  item.imbed ||= item.build_imbed(
    spell_number: 1750,
    activator: "tap",
    persists: true,
    player_rechargeable: true,
    empowerable: true,
    charges: 6,
    max_charges: 31,
  )
  item.update!(
    noun: "armband",
    material: "ora",
    weight: 0,
  )
end

Item.find_or_initialize_by(name: "bone-inlaid ora headband").tap do |item|
  klass = BasicItem
  item.details ||= klass.new(
    worn: "head",
    kind: "jewelry",
  )
  item.enhancive ||= Enhancive.new(
    persists: true,
    rechargeable: true
  )
  item.enhancive_properties.tap do |ep|
    ep.find_or_initialize_by(kind: "Spell Aiming Bonus").update(amount: 5, minimum_level: 15)
    ep.find_or_initialize_by(kind: "Intuition Bonus").update(amount: 1, minimum_level: 3)
    ep.find_or_initialize_by(kind: "First Aid Bonus").update(amount: 1, minimum_level: 1)
  end
  item.update!(
    noun: "headband",
    material: "ora",
    weight: 0,
  )
end

Item.find_or_initialize_by(name: "long vaalin-hued gown").tap do |item|
  klass = BasicItem
  item.details ||= klass.new(
    worn: "torso",
    kind: "clothing",
    capacity: 4,
  )
  item.update!(
    noun: "gown",
    material: "vaalin",
    weight: 3,
    long_description: "long vaalin-hued gown with a single sweeping bell sleeve",
  )
  #item.script ||= ItemScript.create!(name: "Metallic Gown")
end

Item.find_or_initialize_by(name: "some violet feystone-pipped dice").tap do |item|
  klass = BasicItem
  item.details ||= klass.new(
    worn: "no",
    kind: "fluff",
  )
  item.update!(
    noun: "dice",
    weight: 0,
  )
  #item.script ||= ItemScript.create!(name: "Rollable Dice: 3d6")
end

Item.find_or_initialize_by(name: "dove-colored leather sheath").tap do |item|
  klass = BasicItem
  item.details ||= klass.new(
    worn: "waist (as belt)",
    kind: "clothing",
  )
  item.update!(
    noun: "sheath",
    weight: 0,
    long_description: "dove-colored leather sheath inlaid with brilliant lilac glimaerstone",
  )
  #item.script ||= ItemScript.create!(name: "Warrior Sheath")
end

Item.find_or_initialize_by(name: "enormous tanned frogskin purse").tap do |item|
  klass = BasicItem
  item.details ||= klass.new(
    worn: "shoulder",
    kind: "container",
    capacity: 100,
  )
  item.update!(
    noun: "purse",
    weight: 0,
    long_description: "enormous tanned frogskin purse crafted from the body of a bloated albino bullfrog",
  )
end

Item.find_or_initialize_by(name: "hooded ash grey faille cloak").tap do |item|
  klass = BasicItem
  item.details ||= klass.new(
    worn: "cloak",
    kind: "container",
    capacity: 100,
  )
  item.update!(
    noun: "cloak",
    weight: 5,
    long_description: "hooded ash grey faille cloak patterned with a amber yellow slit-pupiled eye motif",
  )
  item.enhancive ||= Enhancive.new(
    persists: true,
    rechargeable: true
  )
  item.enhancive_properties.tap do |ep|
    ep.find_or_initialize_by(kind: "Spell Aiming Bonus").update(amount: 2)
    ep.find_or_initialize_by(kind: "Mana Recovery").update(amount: 2)
  end
end

Item.find_or_initialize_by(name: "flowing indigo linen skirt").tap do |item|
  klass = BasicItem
  item.details ||= klass.new(
    worn: "legs",
    kind: "clothing",
    capacity: 0,
  )
  item.update!(
    noun: "skirt",
    weight: 0,
    long_description: "flowing indigo linen skirt embroidered with silver whorls",
  )
  #item.script ||= ItemScript.create!(name: "Rainbow Wear")
end

Item.find_or_initialize_by(name: "dreamstone inset platinum bracer").tap do |item|
  klass = BasicItem
  item.details ||= klass.new(
    worn: "wrist",
    kind: "jewelry",
  )
  item.update!(
    noun: "bracer",
    weight: 0,
  )
  item.enhancive ||= Enhancive.new(
    persists: true,
    rechargeable: true
  )
  item.enhancive_properties.tap do |ep|
    ep.find_or_initialize_by(kind: "Brawling Bonus").update(amount: 2, minimum_level: 10)
  end
  item.imbed ||= item.build_imbed(
    spell_number: 606,
    activator: "rub",
    persists: true,
    player_rechargeable: true,
    empowerable: false,
    charges: 8,
    max_charges: 40,
  )
end

Item.find_or_initialize_by(name: "engraved sterling silver band ring").tap do |item|
  klass = BasicItem
  item.details ||= klass.new(
    worn: "finger",
    kind: "jewelry",
  )
  item.update!(
    noun: "ring",
    weight: 0,
  )
  item.enhancive ||= Enhancive.new(
    persists: false,
    rechargeable: true
  )
  item.enhancive_properties.tap do |ep|
    ep.find_or_initialize_by(kind: "Dexterity Bonus").update(amount: 2, minimum_level: 11)
    ep.find_or_initialize_by(kind: "Agility Bonus").update(amount: 2, minimum_level: 11)
  end
  item.imbed ||= item.build_imbed(
    spell_number: 602,
    activator: "rub",
    persists: true,
    player_rechargeable: true,
    empowerable: false,
    charges: 11,
    max_charges: 40,
  )
end

Item.find_or_initialize_by(name: "pair of black hobnailed boots").tap do |item|
  klass = BasicItem
  item.details ||= klass.new(
    worn: "feet",
    kind: "clothing",
  )
  item.update!(
    noun: "boots",
    weight: 2,
  )
end

Item.find_or_initialize_by(name: "chased ora talisman").tap do |item|
  klass = BasicItem
  item.details ||= klass.new(
    worn: "neck",
    kind: "jewelry",
  )
  item.update!(
    noun: "talisman",
    weight: 0,
    loresong_unlocked: true,
  )
  item.enhancive ||= Enhancive.new(
    persists: true,
    rechargeable: true
  )
  item.enhancive_properties.tap do |ep|
    ep.find_or_initialize_by(kind: "Spell Aiming Bonus").update(amount: 5, minimum_level: 15)
  end
  item.imbed ||= item.build_imbed(
    spell_number: 313,
    activator: "tap",
    persists: true,
    player_rechargeable: true,
    empowerable: false,
    charges: 0,
    max_charges: 40,
  )
end

Item.find_or_initialize_by(name: "pristine white medicine kit").tap do |item|
  klass = BasicItem
  item.details ||= klass.new(
    worn: "hip (on belt)",
    kind: "container",
    capacity: 60,
  )
  item.update!(
    noun: "kit",
    weight: 2,
    long_description: "pristine white medicine kit clasped with a vaalin-bound violet feystone",
  )
  # item.script = "Auto-Bundling Herb Pouch"
end

Item.find_or_initialize_by(name: "engraved mithril earcuff").tap do |item|
  klass = BasicItem
  item.details ||= klass.new(
    worn: "earlobe",
    kind: "jewelry",
  )
  item.update!(
    noun: "earcuff",
    weight: 0,
    loresong_unlocked: true,
  )
  item.enhancive ||= Enhancive.new(
    persists: false,
    rechargeable: true
  )
  item.enhancive_properties.tap do |ep|
    ep.find_or_initialize_by(kind: "Blunt Weapons Bonus").update(amount: 6, minimum_level: 21)
    ep.find_or_initialize_by(kind: "Dexterity Base").update(amount: 5, minimum_level: 15)
  end
end

Item.find_or_initialize_by(name: "some deathstone earrings").tap do |item|
  klass = BasicItem
  item.details ||= klass.new(
    worn: "earlobes",
    kind: "jewelry",
  )
  item.update!(
    noun: "earrings",
    weight: 1,
    loresong_unlocked: false,
  )
  item.imbed ||= item.build_imbed(
    spell_number: 117,
    activator: "rub",
    persists: true,
    player_rechargeable: true,
    empowerable: false,
    charges: 40,
    max_charges: 40,
  )
end

Item.find_or_initialize_by(name: "nacre and ghezyte dolphin anklet").tap do |item|
  klass = BasicItem
  item.details ||= klass.new(
    worn: "ankle",
    kind: "jewelry",
  )
  item.update!(
    noun: "anklet",
    weight: 1,
    loresong_unlocked: false,
    material: "ghezyte",
    long_description: "nacre and ghezyte dolphin bracelet with tiny web-spun sea blue tidal pearls",
  )

  # item.script = "Caligos Isle Quest Jewelry"
end

Item.find_or_initialize_by(name: "weathered leather harness").tap do |item|
  klass = BasicItem
  item.details ||= klass.new(
    worn: "front",
    kind: "clothing",
    capacity: 100,
  )
  item.update!(
    noun: "harness",
    weight: 2,
    loresong_unlocked: false,
    long_description: "weathered leather harness made from a multitude of straps",
  )

  # item.script = "Pirate Harness"
end

Item.find_or_initialize_by(name: "pair of black mithglin gauntlets").tap do |item|
  klass = BasicItem
  item.details ||= klass.new(
    worn: "hands",
    kind: "clothing",
  )
  item.update!(
    noun: "gloves",
    weight: 1,
    loresong_unlocked: false,
    long_description: "pair of black mithglin gauntlets swirled with blue streaks",
  )

  # item.script = "Bazzelwyn Gloves" # https://gswiki.play.net/Bazzelwyn_gloves
end

Item.find_or_initialize_by(name: "some holy socks").tap do |item|
  klass = BasicItem
  item.details ||= klass.new(
    worn: "sock",
    kind: "clothing",
  )
  item.update!(
    noun: "socks",
    weight: 1,
    loresong_unlocked: true,
  )

  item.enhancive ||= Enhancive.new(
    persists: true,
    rechargeable: true
  )
  item.enhancive_properties.tap do |ep|
    ep.find_or_initialize_by(kind: "Cleric Spell Ranks").update(amount: 50)
  end
end

Item.find_or_initialize_by(name: "spiral-shaped silver haircomb").tap do |item|
  klass = BasicItem
  item.details ||= klass.new(
    worn: "hair",
    kind: "clothing",
  )
  item.update!(
    noun: "haircomb",
    weight: 1,
    loresong_unlocked: false,
    long_description: "spiral-shaped silver haircomb with an iridescent sheen",
  )

  # item.script = "Fully Unlocked Veola Barrette" # https://gswiki.play.net/Veola_hair_accessory
end

Item.find_or_initialize_by(name: "stained off-white cotton gambeson").tap do |item|
  klass = BasicItem
  item.details ||= klass.new(
    worn: "undershirt",
    kind: "clothing",
  )
  item.update!(
    noun: "gambeson",
    weight: 2,
    loresong_unlocked: false,
  )

  item.enhancive ||= Enhancive.new(
    persists: true,
    rechargeable: true
  )
  item.enhancive_properties.tap do |ep|
    ep.find_or_initialize_by(kind: "Armor Use Bonus").update(amount: 10)
  end
end

Item.find_or_initialize_by(name: "some faded green leggings").tap do |item|
  klass = BasicItem
  item.details ||= klass.new(
    worn: "leggings",
    kind: "clothing",
  )
  item.update!(
    noun: "leggings",
    weight: 2,
    loresong_unlocked: false,
  )
end
