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

puts "Destroying UserRoles."
UserRole.destroy_all
puts "Destroying Positions."
Position.destroy_all
puts "Destroying Roles"
Role.destroy_all
puts "Destroying Teams"
Team.destroy_all
puts "Destroying Users"
User.destroy_all

puts "Creatng Users"
15.times do 
	name = Faker::Name.first_name
	email = name + "@gmail.com"

	User.create(
		name: name,
		email_address: email
	)
end
puts "Users: #{User.all.length}"

puts "Creatng Teams"
15.times do |i|
	Team.create(
		name: Faker::Company.name,
		website: Faker::Internet.domain_name,
		admin: i
	)
end
puts "Teams: #{Team.all.length}"

roles = [
	"developer",
	"product owner",
	"project manager",
	"scrum master",
	"architect",
	"ux/ui",
	"devops",
	"qa"
]

puts "Creating Roles"

roles.each do |role|
	Role.create(
		name: role
	)
end

puts "Roles: #{Role.all.length}"

puts "Creating UserRoles"

15.times do 
	r_id = rand(1..8)  
	UserRole.create(
		user_id: rand(1..15),
		role_id: r_id,
		name: Role.find_by(id: r_id).name,
		years_exp: rand(1..10)
	)
end

puts "UserRoles: #{UserRole.all.length}"

puts "Creating Positions"

15.times do
	r_id = rand(1..8)
	Position.create(
		name: Role.find_by(id: r_id).name,
		role_id: r_id,
		user_id: rand(1..15),
		team_id: rand(1..15)
	)
end
puts "Positions: #{Position.all.length}"
puts "---------------------------"
puts
puts "Success! 😎"
puts
puts "---------------------------"
puts "No Roles:"
noRoles = User.all.filter { 
	|u| u.roles.count == 0 }.map { 
	|u| puts u.email_address }
puts "---------------------------"
puts "Roles:"
hasRoles = User.all.filter { 
	|u| u.roles.count > 1 }.sort.reverse.map { 
	|u| u.email_address + " (" + u.roles.count.to_s + ")"}

puts hasRoles