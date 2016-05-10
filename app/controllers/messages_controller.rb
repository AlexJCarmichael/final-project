class MessagesController < ApplicationController
  def index
    if gameId
      @messages = Message.all.where("chat_session_id =?" )
      respond_to do |format|
        format.json do
          render json: @messages
        end
      end
    else
      @messages = Message.all
      redirect_to :back
    end
  end

  def update
    message = Message.find(params[:id])
    if message.update(message_params)
      respond_to do |format|
        format.json do
          render json: { message: "Message updated" }
        end
      end
    end
  end

  def create
    message = current_user.messages.build(message_params)
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
    params.require(:message).permit(:body, :user_id, :chat_session_id)
  end
end
