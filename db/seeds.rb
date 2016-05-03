# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create( user_name: "Jaxom555", name: "Dane", email: "test@test.test", password: "password" )
user2 = User.create( user_name: "Vpatel90", name: "Vivek", email: "vivek@test.test", password: "password" )
user3 = User.create( user_name: "Vanderson", name: "Van", email: "van@test.test", password: "password" )
sheet = SheetTemplate.create( game_name: "Danes and Dragons" )

jaxom = Character.create( name: "Jaxom Vanee", bio: "You know Jaxom", user_id: user.id, sheet_template_id: sheet.id )
a_random_hero = Character.create( name: "A Random Hero", bio: "You know A Random Hero", user_id: user2.id, sheet_template_id: sheet.id )
morales = Character.create( name: "Morales", bio: "You know Morales", user_id: user3.id, sheet_template_id: sheet.id )

characters = [jaxom, a_random_hero, morales]

str1 = Stat.create( name: "Strength", value: 6 )
str2 = Stat.create( name: "Strength", value: 3 )
str3 = Stat.create( name: "Strength", value: 12 )
str4 = Stat.create( name: "Strength", value: 9 )
dex1 = Stat.create( name: "Dexterity", value: 1 )
dex2 = Stat.create( name: "Dexterity", value: 12 )
dex3 = Stat.create( name: "Dexterity", value: 15 )
dex4 = Stat.create( name: "Dexterity", value: 18 )

strength = [str1, str2, str3, str4]
dexterity = [dex1, dex2, dex3, dex4]

acro1 = Skill.create( name: "Acrobatics", value: 12 )
acro2 = Skill.create( name: "Acrobatics", value: 18 )
acro3 = Skill.create( name: "Acrobatics", value: 6 )
acro4 = Skill.create( name: "Acrobatics", value: 7 )
sword1 = Skill.create( name: "Sword", value: 2 )
sword2 = Skill.create( name: "Sword", value: 5 )
sword3 = Skill.create( name: "Sword", value: 7 )
sword4 = Skill.create( name: "Sword", value: 8 )

acroArr = [acro1, acro2, acro3, acro4]
swordArr = [sword1, sword2, sword3, sword4]

weapon1 = Equipment.create( name: "Katana", damage: "2d6", category: "Weapon", weight: "3lbs" )
weapon2 = Equipment.create( name: "Rapier", damage: "1d6+2", category: "Weapon", weight: "2lbs" )
weapon3 = Equipment.create( name: "Broadsword", damage: "2d6+1", category: "Weapon", weight: "5lbs" )
weapon4 = Equipment.create( name: "Dirk", damage: "1d6", category: "Weapon", weight: "1lbs" )
armor1 = Equipment.create( name: "Hermes Boots", category: "Armor", weight: "1lb", effects: "Allows the character to jump 30 feet." )
armor2 = Equipment.create( name: "Inari Okami Robes", category: "Armor", weight: "2lb", effects: "Allows the character increased luck(GM's discretion)." )
armor3 = Equipment.create( name: "Odin's Ring", category: "Armor", weight: ".5lb", effects: "Grants the character +2 intelligence." )
armor4 = Equipment.create( name: "Quetzalcoatl's bracer", category: "Armor", weight: "1lb", effects: "Allows the character to deflect arrows." )

weaponArr = [weapon1, weapon2, weapon3, weapon4]
armorArr = [armor1,armor2, armor3, armor4]

characters.each do |char|
  CharStat.create( character_id: char.id, stat_id: strength.sample.id )
  CharStat.create( character_id: char.id, stat_id: dexterity.sample.id )

  CharSkill.create( character_id: char.id, skill_id: acroArr.sample.id )
  CharSkill.create( character_id: char.id, skill_id: swordArr.sample.id )

  CharEquip.create( character_id: char.id, equipment_id: weaponArr.sample.id )
  CharEquip.create( character_id: char.id, equipment_id: armorArr.sample.id )
end

session = GameSession.create(session_name: "Dane's Cool Game", user_id: user.id)

Player.create( user_id: user2.id, game_session_id: session.id )
Player.create( user_id: user3.id, game_session_id: session.id )
