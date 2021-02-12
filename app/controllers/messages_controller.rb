class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @messages = @message.room.messages
    @message.save

    respond_to do |format|
      format.html { redirect_to request.referer }
      format.js
    end
  end

  private
  def message_params
    params.require(:message).permit(:user_id, :room_id, :body)
  end

end
