# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
users = User.create([
                      {
                        username: "demo",
                        email: "demo@localhost.com",
                        password: "password",
                        password_confirmation: "password"
                      },
                      {
                        username: "demo1",
                        email: "demo1@localhost.com",
                        password: "password",
                        password_confirmation: "password"
                      },
                      {
                        username: "demo2",
                        email: "demo2@localhost.com",
                        password: "password",
                        password_confirmation: "password"
                      }
                    ])

rooms = Room.create([
                      { name: 'Politics' },
                      { name: 'Automotive' },
                      { name: 'International' },
                      { name: 'Sports' },
                    ])

50.times do
  Message.create(
    body: Faker::Lorem.sentence(word_count: 10),
    user_id: rand(1..3),
    room_id: rand(1..4)
  )
end