class User < ApplicationRecord
	has_many :positions, :dependent => :destroy
	has_many :teams, through: :positions, :dependent => :destroy
	has_many :user_roles, :dependent => :destroy
	has_many :roles, through: :user_roles, :dependent => :destroy

	validates :name, 	presence: true,
										length: { minimum: 2 }
	validates :email_address, email: true, 
														uniqueness: true
														
	# validates :bio,		length: { maximum: 500,
	# 														too_long: "%{count} characters is the maximum allowed" }
end
