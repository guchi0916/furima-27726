class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, 
                :city, :address, :build_name, :phone_number, :purchase_id, :token


  with_options presence: true do  
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A\d{11}\z/}
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, 
                   prefecture_id: prefecture_id, 
                   city: city, 
                   address: address, 
                   build_name: build_name,
                   phone_number: phone_number,
                   purchase_id: purchase.id)  
  end

  
end