class Purchase < ApplicationRecord



  validates :item, presence: true
  validates :user, presence: true
  validates :purchase, presence: true
  validates :building_name, presence: true
  validates :address_line, presence: true
  validates :city, presence: true
  validates :prefecture_id, presence: true
  validates :postal_code, presence: true
  validates :telephone, presence: true

  validates :fuga, numericality: { greater_than: 0 }




  belongs_to :item
  belongs_to :user
  has_one :address
end
