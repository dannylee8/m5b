class Position < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :team

	validates :name, 	presence: true
end
