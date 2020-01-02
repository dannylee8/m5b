class Position < ApplicationRecord
	belongs_to :user, optional: true, :dependent => :destroy
	belongs_to :team, :dependent => :destroy

	validates :name, 	presence: true
end
