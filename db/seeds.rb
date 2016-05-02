# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create(user_name: "Jaxom555", name: "Dane", email: "test@test.test", password: "password")

sheet = SheetTemplate.create( game_name: "Danes and Dragons" )

jaxom = Character.create( name: "Jaxom Vanee", bio: "You know Jaxom", user_id: user.id, sheet_template_id: sheet.id )

stat = Stat.create( name: "Strength", value: 6 )
stat2 = Stat.create( name: "Dexterity", value: 12 )

CharStat.create( character_id: jaxom.id, stat_id: stat.id )
CharStat.create( character_id: jaxom.id, stat_id: stat2.id )

skill1 = Skill.create( name: "Acrobatics", value: 12 )
skill2 = Skill.create( name: "Sword", value: 2 )

CharSkill.create( character_id: jaxom.id, skill_id: skill1.id )
CharSkill.create( character_id: jaxom.id, skill_id: skill2.id )

equip1 = Equipment.create( name: "Katana", damage: "2d6", category: "Weapon", weight: "3lbs" )
equip2 = Equipment.create( name: "Hermes Boots", category: "Armor", weight: "1lb", effects: "Allows the character to jump 30 feet." )

CharEquip.create( character_id: jaxom.id, equipment_id: equip1.id )
CharEquip.create( character_id: jaxom.id, equipment_id: equip2.id )
