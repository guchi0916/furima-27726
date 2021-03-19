 # Furimaー27726 DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|

### Association
- has_many :items
- has_many :purchases

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|item_detail|text|null: false|
|category_id|integer|null: false|
|status_id|integer|null: false|
|charge_delivery_fee_id|integer|null: false|
|prefecture_id|integer|null: false|
|day_id|integer|null: false|
|user_id|references|null: false、foreign_key: true|

### Association
- belongs_to :user
- has_one :purchase

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|build_name|string|-------|
|phone_number|string|null: false|
|purchase_id|integer|null: false、foreign_key: true|

### Association
- belongs_to :purchase

## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association
- has_one :address
- belongs_to :user
- belongs_to :item
