class Room < ApplicationRecord
  has_many :user_rooms, dependent: :destroy
  has_many :users, through: :user_rooms

  has_many :chats, dependent: :destroy


  def companion_for(current_user)
    self.users.each do |user|
      unless user == current_user
        return user
        break
      end
    end
  end

  def self.set_room_id(current_user, companion_user)
    rooms = current_user.rooms
    room_id = nil

    rooms.each do |room|
      if room.user_rooms.find_by(user_id: companion_user.id)
        room_id = room.id
        break
      end
    end

    return room_id

  end


end
