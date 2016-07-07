class Company < ActiveRecord::Base
  has_many :products
  validates :name, presence: true, length: { maximum: 25 }
end
