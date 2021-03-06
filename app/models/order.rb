class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :company
  default_scope -> { order('created_at DESC') }
  validates :dish1_id, presence: true
  validates :dish2_id, presence: true
  validates :dish3_id, presence: true
  validates :user_id, presence: true
  validates :address, presence: true, length: { maximum: 25 }
  validates :company_id, presence: true
end
