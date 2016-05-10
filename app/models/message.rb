class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :chat_session

  def as_json(_ = nil)
    super(include: [:user])
  end
end
