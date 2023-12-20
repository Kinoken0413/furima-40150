class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  validates :image, presence: true 
  validates :item_name, presence: true, length: { maximum: 40 }
  validates :item_explanation, presence: true, length: { maximum: 1000 }
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sales_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
  validates :item_price, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 9_999_999, message: 'must be less than or equal to 9999999' }
  validates :item_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, message: 'must be greater than or equal to 300' }, if: -> { item_price.present? }
end
