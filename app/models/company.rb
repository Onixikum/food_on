class Company < ActiveRecord::Base
  has_many :products
  has_many :orders
  validates :name, presence: true, length: { maximum: 25 }
end
