# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create(user_name: "Jaxom555", name: "Dane", email: "jaxom555@gmail.com", password: "password")
user2 = User.create(user_name: "Vpatel90", name: "Vivek", email: "vnp229@gmail.com", password: "password")
user3 = User.create(user_name: "Vanderson", name: "Van", email: "van@test.test", password: "password")
user4 = User.create(user_name: "Tiffosan", name: "Tiffo", email: "tiffo@test.test", password: "password")
User.create(user_name: "Reicht", name: "Jordanidiah", email: "jordan@test.test", password: "password")

Friend.create(user_id: user.id, to_user_id: user2.id, status: "accepted")
Friend.create(user_id: user.id, to_user_id: user3.id, status: "accepted")
Friend.create(user_id: user.id, to_user_id: user4.id, status: "pending")

sheet = SheetTemplate.create(game_name: "Dungeons and Dragons 3.5", user_id: 1)

sheet_stats = []

sheet_stats << Stat.create(name: "Strength")
sheet_stats << Stat.create(name: "Dexterity")
sheet_stats << Stat.create(name: "Constitution")
sheet_stats << Stat.create(name: "Intelligence")
sheet_stats << Stat.create(name: "Wisdom")
sheet_stats << Stat.create(name: "Charisma")

sheet_skills = []

sheet_skills << Skill.create(name: "Appraise")
sheet_skills << Skill.create(name: "Balance")
sheet_skills << Skill.create(name: "Bluff")
sheet_skills << Skill.create(name: "Climb")
sheet_skills << Skill.create(name: "Concentration")
sheet_skills << Skill.create(name: "Decipher Script")
sheet_skills << Skill.create(name: "Diplomacy")
sheet_skills << Skill.create(name: "Disable Device")
sheet_skills << Skill.create(name: "Disguise")
sheet_skills << Skill.create(name: "Escape Artist")
sheet_skills << Skill.create(name: "Forgery")
sheet_skills << Skill.create(name: "Gather Information")
sheet_skills << Skill.create(name: "Handle Animal")
sheet_skills << Skill.create(name: "Heal")
sheet_skills << Skill.create(name: "Hide")
sheet_skills << Skill.create(name: "Intimidate")
sheet_skills << Skill.create(name: "Jump")
sheet_skills << Skill.create(name: "Listen")
sheet_skills << Skill.create(name: "Move Silently")
sheet_skills << Skill.create(name: "Open Lock")
sheet_skills << Skill.create(name: "Ride")
sheet_skills << Skill.create(name: "Search")
sheet_skills << Skill.create(name: "Sense Motive")
sheet_skills << Skill.create(name: "Sleight of Hand")
sheet_skills << Skill.create(name: "Spellcraft")
sheet_skills << Skill.create(name: "Spot")
sheet_skills << Skill.create(name: "Survival")
sheet_skills << Skill.create(name: "Swim")
sheet_skills << Skill.create(name: "Tumble")
sheet_skills << Skill.create(name: "Use Magic Device")
sheet_skills << Skill.create(name: "Use Rope")

sheet_stats.each do |stat|
  SheetStat.create(sheet_template_id: sheet_id, stat_id: stat.id)

sheet_skills.each do |skill|
  SheetSkill.create(sheet_template_id: sheet.id, skill_id: skill.id)
end



session = GameSession.create(session_name: "Dane's Cool Game", user_id: user.id, game_time: Time.new(2016, 5, 20, 20, 0, 0))
ChatSession.create(game_session_id: session.id)

GameSheet.create(game_session_id: session.id, sheet_template_id: sheet.id)

player1 = Player.create(user_id: user.id, game_session_id: session.id)
player2 = Player.create(user_id: user2.id, game_session_id: session.id)
player3 = Player.create(user_id: user3.id, game_session_id: session.id)

jaxom = Character.create(name: "Jaxom Vanee", bio: "You know Jaxom", player_id: player1.id, sheet_template_id: sheet.id, level: "3", currency: "50", npc: false)
a_random_hero = Character.create(name: "A Random Hero", bio: "You know A Random Hero", player_id: player2.id, sheet_template_id: sheet.id, level: "2", currency: "350", npc: false)
morales = Character.create(name: "Morales", bio: "You know Morales", player_id: player3.id, sheet_template_id: sheet.id, level: "5", currency: "500", npc: false)

characters = [jaxom, a_random_hero, morales]

str1 = Stat.create(name: "Strength", rank: 6)
str2 = Stat.create(name: "Strength", rank: 3)
str3 = Stat.create(name: "Strength", rank: 12)
str4 = Stat.create(name: "Strength", rank: 9)
dex1 = Stat.create(name: "Dexterity", rank: 1)
dex2 = Stat.create(name: "Dexterity", rank: 12)
dex3 = Stat.create(name: "Dexterity", rank: 15)
dex4 = Stat.create(name: "Dexterity", rank: 18)

strength = [str1, str2, str3, str4]
dexterity = [dex1, dex2, dex3, dex4]

ride1 = Skill.create(name: "Ride", rank: 12)
ride2 = Skill.create(name: "Ride", rank: 18)
ride3 = Skill.create(name: "Ride", rank: 6)
ride4 = Skill.create(name: "Ride", rank: 7)
hide1 = Skill.create(name: "Hide", rank: 2)
hide2 = Skill.create(name: "Hide", rank: 5)
hide3 = Skill.create(name: "Hide", rank: 7)
hide4 = Skill.create(name: "Hide", rank: 8)

rideArr = [ride1, ride2, ride3, ride4]
hideArr = [hide1, hide2, hide3, hide4]

weapon1 = Equipment.create(name: "Katana", damage: "2d6", category: "Weapon", sub_category: "Sword", weight: "3lbs")
weapon2 = Equipment.create(name: "Rapier", damage: "1d6+2", category: "Weapon", sub_category: "Sword", weight: "2lbs")
weapon3 = Equipment.create(name: "Broadsword", damage: "2d6+1", category: "Weapon", sub_category: "Sword", weight: "5lbs")
weapon4 = Equipment.create(name: "Dirk", damage: "1d6", category: "Weapon", sub_category: "Dagger", weight: "1lbs")
armor1 = Equipment.create(name: "Hermes Boots", category: "Armor", sub_category: "Boots", weight: "1lb", effects: "Allows the character to jump 30 feet.")
armor2 = Equipment.create(name: "Inari Okami Robes", category: "Armor", sub_category: "Robes", weight: "2lb", effects: "Allows the character increased luck(GM's discretion).")
armor3 = Equipment.create(name: "Odin's Ring", category: "Armor", sub_category: "Accesory", weight: ".5lb", effects: "Grants the character +2 intelligence.")
armor4 = Equipment.create(name: "Quetzalcoatl's bracer", category: "Armor", sub_category: "Accesory", weight: "1lb", effects: "Allows the character to deflect arrows.")

weaponArr = [weapon1, weapon2, weapon3, weapon4]
armorArr = [armor1,armor2, armor3, armor4]

weaponArr.each do |item|
  SessionItem.create(equipment_id: item.id, game_session_id: 1)
end

armorArr.each do |item|
  SessionItem.create(equipment_id: item.id, game_session_id: 1)
end

Equipment.create(name: "Sword of the Morning", damage: "3d6", category: "Weapon", sub_category: "Sword", weight: "1lbs")
Equipment.create(name: "Chainmail Hauberk", category: "Armor", armor: "Provides 3 defense", sub_category: "Boots", weight: "5lb")

characters.each do |char|
  CharStat.create(character_id: char.id, stat_id: strength.sample.id)
  CharStat.create(character_id: char.id, stat_id: dexterity.sample.id)

  CharSkill.create(character_id: char.id, skill_id: hideArr.sample.id)
  CharSkill.create(character_id: char.id, skill_id: rideArr.sample.id)

  CharEquip.create(character_id: char.id, equipment_id: weaponArr.sample.id)
  CharEquip.create(character_id: char.id, equipment_id: armorArr.sample.id)
end
