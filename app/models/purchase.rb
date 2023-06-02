class Purchase < ApplicationRecord



  validates :item, presence: true
  validates :user, presence: true
  validates :purchase, presence: true

  validates :postal_code, presence: true,
                          format: { with: /\A\d{3}-\d{4}\z/ }
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :building_name
  validates :house_number, presence: true
  validates :telephone, presence: true,
                        length: { in: 10..11 }, numericality: { only_integer: true }



  belongs_to :item
  belongs_to :user
  has_one :address
end
