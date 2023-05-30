class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :shipping_date
  belongs_to :shipping_origin

  validates :image, presence: { message: "can't be blank" }

  validates :item_name, presence: { message: "can't be blank" },
                        length: { maximum: 40 }
  validates :description, presence: { message: "can't be blank" },
                          length: { maximum: 1000 }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipping_cost_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipping_date_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipping_origin_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :price, presence: { message: "can't be blank" },
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true, message: "is out of setting range" },
                    format: { with: /\A[0-9]+\z/, message: "only allows numerical values" },
                    format: { without: /\./, message: "cannot be a decimal value" }


  has_one_attached :image





  belongs_to :user
  #has_one :purchase
end
