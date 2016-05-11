class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :chat_session

  def roll_dice
    if self.body.match(/\d{1,3}d\d{1,3}/)
      num_times = self.body.match(/\b\d{1,3}/).to_s
      num_times = num_times.to_i
      num_of_sides = self.body.match(/\d{1,3}\b/).to_s
      num_of_sides = num_of_sides.to_i
      rolls = num_times.times.collect { return_die_result(num_of_sides) }
      self.body = rolls.join(" ")
    end
  end

  def return_die_result(sides)
    rand(1..sides)
  end

  def as_json(_ = nil)
    super(include: [:user])
  end
end
