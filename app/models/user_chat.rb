class UserChat < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient, :class_name => "User"

  has_many :messages, as: :chatable

  def display_name(current)
    if self.recipient.name == current.name
      self.user.name
    else
      self.recipient.name
    end
  end
end
