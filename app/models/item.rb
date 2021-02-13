class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :charge_delivery_fee
  belongs_to :prefecture
  belongs_to :day

  belongs_to :user, optional: true

  validates :image, presence: true
  validates :name, presence: true
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to:	300, less_than_or_equal_to: 9999999},
                    format: {with: /\A[0-9]+\z/}
  validates :item_detail, presence: true
  validates :category_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 
  validates :charge_delivery_fee_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :day_id, numericality: { other_than: 1 }
  validates :user_id, presence: true
end
