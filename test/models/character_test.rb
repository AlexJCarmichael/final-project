require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  def setup
    @character = Character.new(name: "Reginaldson", sheet_template_id: 1, bio: "You know Reginaldson", player_id: 1)
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
end
