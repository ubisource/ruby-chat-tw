class Room < ApplicationRecord
  has_many :messages, dependent: :destroy

  # after_create_commit :broadcast_create
  #
  # def broadcast_create
  #   broadcast_append_to "rooms",
  #                       partial: "rooms/room",
  #                       locals: { room: self }
  # end
end
