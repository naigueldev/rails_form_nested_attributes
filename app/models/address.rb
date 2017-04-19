class Address < ApplicationRecord
  belongs_to :user,  required: false
  # validates_presence_of :city
end
