class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :body, presence: true, length: { maximum: 500 }

  after_create_commit :broadcast_create

  def broadcast_create
    puts "Broadcasting message to messages_room_#{self.room.id}"
    broadcast_append_to "messages_room_#{self.room.id}",
                        partial: "messages/message",
                        locals: { message: self, user: self.user }
  end
end
