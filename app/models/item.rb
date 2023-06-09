class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :shipping_date
  belongs_to :shipping_origin

  validates :image, presence: { message: 'を入力してください' }

  validates :user, presence: { message: 'Userを入力してください' }
  validates :item_name, presence: true,
                        length: { maximum: 40, message: '40字以上は入力できません' }
  validates :description, presence: true,
                          length: { maximum: 1000, message: '文字数が多すぎます' }
  validates :category_id, numericality: { other_than: 1, message: 'カテゴリーを入力してください' }
  validates :condition_id, numericality: { other_than: 1, message: '商品の状態を入力してください' }
  validates :shipping_cost_id, numericality: { other_than: 1, message: '配送料を入力してください' }
  validates :shipping_date_id, numericality: { other_than: 1, message: '発送までの日数を入力してください' }
  validates :shipping_origin_id, numericality: { other_than: 1, message: '都道府県を入力してください' }
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300,
                                    less_than_or_equal_to: 9_999_999,
                                    only_integer: true,
                                    message: 'は半角数値で入力してください' }

  validate :price_range

  private

  def price_range
    return unless price.present? && (price < 300 || price > 9_999_999)

    errors.add(:price, '販売価格の範囲内で入力してください')
  end

  has_one_attached :image
  belongs_to :user
  has_one :purchase
end
