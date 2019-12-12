class Team < ApplicationRecord
	has_many :positions
	has_many :users, through: :positions

	validates :admin, presence: true
	
end
