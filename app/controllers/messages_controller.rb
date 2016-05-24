class MessagesController < ApplicationController
  def index
    id = params.fetch(:chat_session_id)
    if id
      @messages = Message.limit(1000).order("created_at desc").where("chat_session_id =?", id).includes(:user)
      respond_to do |format|
        format.json do
          render json: @messages.reverse
        end
      end
    else
      @messages = Message.all
      redirect_to :back
    end
  end

  def update
    message = get_message
    if message.update(message_params)
      respond_to do |format|
        format.json do
          render json: { message: "Message updated" }
        end
      end
    end
  end

  def create
    chat_session = ChatSession.find(params.fetch(:message).fetch(:chat_session_id))
    message = chat_session.messages.build(message_params)
    message.user_id = current_user.id
    if message.body[0..4] == "/roll"
      message.roll_dice
    end
    if message.save
      respond_to do |format|
        format.json do
          render json: { message: "Message posted!" }
        end
      end
    end
  end

  def destroy
    @message = get_message
    @message.destroy
    render json: { message: "Message deleted!" }
  end

  private
  def get_message
    Message.find(params.fetch(:id))
  end

  def message_params
    params.require(:message).permit(:body, :user_id, :chatable_id, :chatable_type)
  end
end
