class Room < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :users, through: :entries

  has_many :messages, dependent: :destroy


  def companion(current_user)
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
      if room.entries.find_by(user_id: companion_user.id)
        room_id = room.id
        break
      end
    end

    return room_id

  end


end
