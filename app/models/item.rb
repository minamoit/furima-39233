class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :shipping_date
  belongs_to :shipping_origin


  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipping_cost_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipping_date_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipping_origin_id, numericality: { other_than: 1, message: "can't be blank" } 



  has_one_attached :images



  belongs_to :user
  #has_one :purchase
end
