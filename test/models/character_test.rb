require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  def setup
    @user = User.create(user_name: "Jaxom555", name: "Dane", email: "test_user@example.com", password: "password")
    @session = GameSession.create(session_name: "Dane's Cool Game", user_id: @user.id, game_time: Time.new(2016, 5, 20, 20, 0, 0))
    @player = Player.create(user_id: @user.id, game_session_id: @session.id)
    @sheet = SheetTemplate.create(game_name: "Dane's Test Game", user_id: @user.id)
    @character = Character.create(name: "Reginaldson", sheet_template_id: @sheet.id, bio: "You know Reginaldson", player_id: @player.id)
  end

  test "should be valid" do
    assert @character.valid?
  end

  test "name should be present" do
    @character.name = ""
    assert_not @character.valid?
  end

  test "player_id should be present" do
    @character.player_id = nil
    assert_not @character.valid?
  end

  test "sheet_template_id should be present" do
    @character.sheet_template_id = nil
    assert_not @character.valid?
  end

  test "character JSON does not return all its Users info" do
    binding.pry
    assert_equal(@character.as_json.fetch("user").keys, ["id", "user_name", "name", "email", "profile_image_id"])
  end
end
