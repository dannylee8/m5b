# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# users: name, email_address
# teams: name, website, admin(user_id)
# positions: name, role, status(boolean),

require 'faker'

5.times do 
	User.create(
		name: Faker::Name.name,
		email_address: Faker::Internet.email
	)
end

5.times do |i|
	Team.create(
		name: Faker::Company.name,
		website: Faker::Internet.url,
		admin: i
	)
end

5.times do
	Position.create(
		name: Faker::Job.title,
		role: Faker::Job.position,
		user_id: rand(1..5),
		team_id: rand(1..5)
	)
end