require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  def setup
    @character = Character.new(name: "Reginaldson", sheet_template_id: 1, bio: "You know Reginaldson", player_id: 1)
  end

  test "should be valid" do
    assert @character.valid?
  end
end
