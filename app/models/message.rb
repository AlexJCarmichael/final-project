require 'securerandom'
class Message < ActiveRecord::Base
  before_save :strip_body

  belongs_to :user
  belongs_to :chat_session

  def roll_dice
    if self.body.match(/\d{1,3}d\d{1,3}/)
      num_times = self.body.match(/\b\d{1,3}/).to_s.to_i
      num_of_sides = self.body.match(/\d{1,3}\b/).to_s.to_i
      original = self.body.match(/\d{1,3}d\d{1,3}/).to_s
      rolls = num_times.times.collect { return_die_result(num_of_sides) }
      self.body = "rolls #{original}, resulting in #{rolls.join(", ")} for a total of #{rolls.reduce(:+)}"
    else
      rolls = 1.times.collect { return_die_result(20) }
      self.body = rolls.join(" ")
    end
  end

  def return_die_result(sides)
    SecureRandom.random_number(1..sides)
  end

  def strip_body
    self.body.strip!
  end

  def users_name
    self.user.name
  end

  def users_username
    self.user.user_name
  end

  def users_image
    self.user.photo_url
  end

  def as_json(_ = nil)
    super(methods: [:users_name, :users_username, :users_image])
  end
end
