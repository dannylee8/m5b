class OffUserRoleSerializer < ActiveModel::Serializer
  attributes :id, :name, :years_exp
  has_one :user
  has_one :role
end
