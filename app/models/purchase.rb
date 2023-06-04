class Purchase < ApplicationRecord

  validates :item, presence: true
  validates :user, presence: true

  has_one :item
  belongs_to :user
  has_one :address
end
