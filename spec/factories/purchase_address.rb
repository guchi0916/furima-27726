FactoryBot.define do

  factory :purchase_address do
    postal_code { '123-4567'}
    prefecture_id { 3 }
    city { 'あああ市' }
    address { '1-1' }
    build_name { 'あああハイツ' }
    phone_number { "09012345678" }
    token {"tok_abcdefghijk00000000000000000"}
  end

end
