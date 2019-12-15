class UserRole < ApplicationRecord
  belongs_to :user, :dependent => :destroy
  belongs_to :role
end
