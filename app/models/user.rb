class User < ApplicationRecord
	has_many :positions
	has_many :teams, through: :positions

	validates :name, 	presence: true,
										length: { minimum: 2 }
	validates :email_address, email: true, 
														uniqueness: true
														
	# validates :bio,		length: { maximum: 500,
	# 														too_long: "%{count} characters is the maximum allowed" }
end
