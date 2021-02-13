class ChatsController < ApplicationController
  def create
    @chat = Chat.new(chat_params)
    @chat.save

    @chats = @chat.room.chats

    respond_to do |format|
      format.html { redirect_to request.referer }
      format.js
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:user_id, :room_id, :body)
  end

end
