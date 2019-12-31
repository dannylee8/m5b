# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

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
##########################################
puts "Creating Users"
1500.times do 
	name = Faker::Name.first_name
	email = name.downcase + "@gmail.com"

	User.create(
		name: name,
		email_address: email
	)
end
puts "Users: #{User.all.length}"
##########################################
puts "Creating Teams"
150.times do |i|
	Team.create(
		name: Faker::Company.name,
		website: Faker::Internet.domain_name,
		admin: i,
		description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
		address: Faker::Address.full_address,
		phone: Faker::PhoneNumber.phone_number_with_country_code
	)
end
puts "Teams: #{Team.all.length}"
##########################################
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
##########################################
puts "Creating UserRoles"
3000.times do
	r_id = rand(1..8)
	UserRole.create(
		user_id: rand(1..1500),
		role_id: r_id,
		name: roles[r_id-1],
		years_exp: rand(1..10)
	)
end
puts "UserRoles: #{UserRole.all.length}"
##########################################
puts "Creating Positions"
3000.times do |i|
	r_id = rand(1..8)
	Position.create(
		name: roles[r_id-1],
		role_id: r_id,
		user_id: rand(1..1500),
		team_id: rand(1..150)
	)
end
puts "Positions: #{Position.all.length}"
##########################################
puts "---------------------------"
puts
puts "Success! 😎"
puts
puts "---------------------------"
puts "No Roles:"
noRoles = User.all.filter { 
	|u| u.roles.count == 0 }.map { 
	|u| u.email_address }
puts noRoles[0,10]
puts "---------------------------"
puts "Roles:"
hasRoles = User.all.filter { 
	|u| u.roles.count > 1 }.sort.reverse.map { 
	|u| u.email_address + " (" + u.roles.count.to_s + ")"}
puts hasRoles[0,10]
puts "---------------------------"
puts "No Teams:"
noTeams = User.all.filter {
	|u| u.teams.count == 0 }.map {
	|u| u.email_address }
puts noTeams[0,10]
puts "---------------------------"
puts "Has Teams:"
hasTeams = User.all.filter {
	|u| u.teams.count > 0 }.sort.reverse.map {
	|u| u.email_address + " (" + u.teams.count.to_s + ")" }
puts hasTeams[0,10]
puts "---------------------------"
puts "finished"
