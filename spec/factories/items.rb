FactoryBot.define do
  factory :item do                     
    name                         {"商品"}
    item_detail                  {Faker::Lorem.sentence}
    price                        {3000}
    category_id                  {2}
    status_id                    {2}
    charge_delivery_fee_id       {2}
    prefecture_id                {2}
    day_id                       {2}
    user
  end
end
