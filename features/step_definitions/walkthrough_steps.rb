Given(/^I have an existing test environment/) do
  user = User.create(user_name: "Jaxom555", name: "Dane", email: "test@test.test", password: "password")
  user2 = User.create(user_name: "Vpatel90", name: "Vivek", email: "vivek@test.test", password: "password")
  user4 = User.create(user_name: "Tiffosan", name: "Tiffo", email: "tiffo@test.test", password: "password")

  Friend.create(user_id: user.id, to_user_id: user2.id, status: "accepted")
  Friend.create(user_id: user.id, to_user_id: user4.id, status: "pending")

  sheet = SheetTemplate.create(game_name: "Danes and Dragons", user_id: user.id)

  sheet_skill1 = Skill.create(name: "Acrobatics")
  sheet_skill2 = Skill.create(name: "Sword")
  sheet_stat1 = Stat.create(name: "Strength")
  sheet_stat2 = Stat.create(name: "Dexterity")

  SheetSkill.create(sheet_template_id: sheet.id, skill_id: sheet_skill1.id)
  SheetSkill.create(sheet_template_id: sheet.id, skill_id: sheet_skill2.id)
  SheetStat.create(sheet_template_id: sheet.id, stat_id: sheet_stat1.id)
  SheetStat.create(sheet_template_id: sheet.id, stat_id: sheet_stat2.id)

  session = GameSession.create(session_name: "Dane's Cool Game", user_id: user.id, game_time: Time.new(2016, 5, 20, 15, 0, 0).utc)
  ChatSession.create(game_session_id: session.id)

  GameSheet.create(game_session_id: session.id, sheet_template_id: sheet.id)

  player1 = Player.create(user_id: user.id, game_session_id: session.id)

  jaxom = Character.create(name: "Jaxom Vanee", bio: "You know Jaxom", player_id: player1.id, sheet_template_id: sheet.id, npc: false)

  characters = [jaxom]

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

  acro1 = Skill.create(name: "Acrobatics", rank: 12)
  acro2 = Skill.create(name: "Acrobatics", rank: 18)
  acro3 = Skill.create(name: "Acrobatics", rank: 6)
  acro4 = Skill.create(name: "Acrobatics", rank: 7)
  sword1 = Skill.create(name: "Sword", rank: 2)
  sword2 = Skill.create(name: "Sword", rank: 5)
  sword3 = Skill.create(name: "Sword", rank: 7)
  sword4 = Skill.create(name: "Sword", rank: 8)

  acroArr = [acro1, acro2, acro3, acro4]
  swordArr = [sword1, sword2, sword3, sword4]

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
    SessionItem.create(equipment_id: item.id, game_session_id: session.id)
  end

  armorArr.each do |item|
    SessionItem.create(equipment_id: item.id, game_session_id: session.id)
  end

  characters.each do |char|
    CharStat.create(character_id: char.id, stat_id: strength.sample.id)
    CharStat.create(character_id: char.id, stat_id: dexterity.sample.id)

    CharSkill.create(character_id: char.id, skill_id: acroArr.sample.id)
    CharSkill.create(character_id: char.id, skill_id: swordArr.sample.id)

    CharEquip.create(character_id: char.id, equipment_id: weaponArr.sample.id)
    CharEquip.create(character_id: char.id, equipment_id: armorArr.sample.id)
  end

end

When(/^I go to the root path$/) do
  visit root_path
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, content|
  fill_in(field, with: content)
end

When(/^I press "([^"]*)"$/) do |name|
  click_button(name)
end

When(/^I click "([^"]*)"$/) do |name|
  click_link(name)
end

Then(/^I should see "([^"]*)"$/) do |header|
  assert page.has_content?(header)
end
