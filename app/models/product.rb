class Product < ActiveRecord::Base
  belongs_to :company
  default_scope -> { order('created_at DESC') }
  validates :name, presence: true, length: { maximum: 25 }
  validates :price, presence: true
  validates :food_type, presence: true
  validates :company_id, presence: true
end
