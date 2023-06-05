class Address < ApplicationRecord
  validates :shipping_origin_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :postal_code, presence: { message: "can't be blank" },
                          format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :city, presence: { message: "can't be blank" }
  validates :house_number, presence: { message: "can't be blank" }
  validates :telephone, length: { in: 10..11 }, numericality: { only_integer: true }

  belongs_to :purchase
end
