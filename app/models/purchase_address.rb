class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :card-cvc, :hoge, :item_id, :postal_code, :shipping_origin_id, :city, :house_number, :building_name, :telephone, :user_id

  with_options presence: true do
    validates :postal_code, presence: { message: "can't be blank" },
                            format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipping_origin_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, presence: { message: "can't be blank" }
    validates :house_number, presence: { message: "can't be blank" }
    validates :telephone, length: { in: 10..11 }, numericality: { only_integer: true }
    validates :user_id, presence: true
    validates :item_id, presence: true
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(
      postal_code: postal_code,
      shipping_origin_id: shipping_origin_id,
      city: city,
      house_number: house_number,
      building_name: building_name,
      telephone: telephone,
      purchase_id: purchase.id
    )
  end
end
