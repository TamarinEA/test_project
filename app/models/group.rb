class Group < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :products, dependent: :destroy
  validates :name, uniqueness: true
end
