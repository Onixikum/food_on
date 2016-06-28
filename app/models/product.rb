class Product < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }
  validates :name, presence: true, length: { maximum: 25 }
  validates :price, presence: true
  validates :food_type, presence: true
end
