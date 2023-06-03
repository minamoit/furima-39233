class Address < ApplicationRecord

  validates :shipping_origin_id, numericality: {other_than: 0, message: "can't be blank"}
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :shipping_origin_id, presence: { message: "can't be blank" }
  validates :city, presence: { message: "can't be blank" }
  validates :house_number, presence: { message: "can't be blank" }
  validates :telephone, presence: { message: "can't be blank" },
                        length: { in: 10..11 }, numericality: { only_integer: true }

  belongs_to :purchase
end
