class User < ApplicationRecord
  # validates_presence_of :name
  has_many :address
  accepts_nested_attributes_for :address, allow_destroy: true,
  reject_if: proc { |attributes| attributes['city'].blank? }
end
