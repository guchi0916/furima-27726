class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  has_one :purchase
  
  belongs_to :category
  belongs_to :status
  belongs_to :charge_delivery_fee
  belongs_to :prefecture
  belongs_to :day
  belongs_to :user 
  
  with_options presence: true do  
    validates :image
    validates :name
    validates :price, numericality: { greater_than_or_equal_to:	300, less_than_or_equal_to: 9999999},
                      format: {with: /\A[0-9]+\z/}
    validates :item_detail
  end
  
  with_options numericality: { other_than: 1 } do  
    validates :category_id
    validates :status_id
    validates :charge_delivery_fee_id
    validates :prefecture_id
    validates :day_id
  end

end
