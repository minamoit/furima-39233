class Purchase < ApplicationRecord

  validates :item, presence: true
  validates :user, presence: true

  belongs_to :item
  belongs_to :user
  has_one :address
end