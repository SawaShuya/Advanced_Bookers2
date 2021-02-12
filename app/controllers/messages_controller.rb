class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.save
    redirect_to room_path(@message.room)
  end

  private
  def message_params
    params.require(:message).permit(:user_id, :room_id, :body)
  end

end
