require 'test_helper'

class StatsControllerTest < ActionController::TestCase
  def setup
    @stat = Stat.create(name: "Cool Stat")
    @params =  {"stats"=>{"rank"=>"10"}, "id"=>@stat.id}
  end

  def test_find_update
    stat = Stat.find(@params.fetch("id"))
    assert_equal(stat.id , @stat.id)
  end
end
