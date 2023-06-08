class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :item_id, :postal_code, :shipping_origin_id, :city, :house_number, :building_name, :telephone, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は「3桁-4桁」の半角数値で入力してください' }
    validates :shipping_origin_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates :city
    validates :house_number
    validates :telephone, length: { in: 10..11 }, numericality: { only_integer: true, message: '電話番号は数値で入力してください' }
    validates :user_id
    validates :item_id
    validates :token
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
