class RoomsController < ApplicationController
  before_action :screen_user, only: [:show]

  def show
    @messages = @room.messages
    @message = Message.new
    @member = @room.companion(current_user)
  end

  def index
    @rooms = current_user.rooms
    @book = Book.new
  end

  def set_room
    user = User.find(params[:user_id])
    room_id = Room.set_room_id(current_user, user)
  

    if room_id.present?
      room = Room.find(room_id)
    else
      room = Room.new
      entries = room.entries.build([{user_id: current_user.id}, {user_id: user.id}])
      room.save
    end
    
    redirect_to room_path(room)
  end

  private
  def screen_user
    @room = Room.find(params[:id])
    member_ids = @room.entries.pluck(:user_id)
    unless member_ids.find {|id| id == current_user.id }.present?
      redirect_to rooms_path
    end
  end
end
