class Room < ApplicationRecord
  has_many :messages, dependent: :destroy

  after_create_commit do
    broadcast_append_to "rooms"
  end

  after_destroy_commit do
    broadcast_remove_to "rooms"
  end
end
