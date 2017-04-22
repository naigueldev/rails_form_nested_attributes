class User < ApplicationRecord
  # validates_presence_of :name
  has_many :address
  accepts_nested_attributes_for :address, allow_destroy: true,
  reject_if: proc { |attributes| attributes['city'].blank? }

  def self.import(file, user_id)
    CSV.foreach(file.path, headers: true) do |row|
      Address.create(
        :user_id => user_id,
        :city => row[0]
      )
    end
  end


end
