 # Furimaー27726 DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|name|string|null: false|
|name_kana|string|null: false|
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
|category|string|null: false|
|status|string|null: false|
|charge_delivery_fee|text|null: false|
|ship_form_area|string|null: false|
|days|text|null: false|
|user_id|integer|foreign_key: true|

### Association
- belongs_to :user
- has_one :purchase
- has_many :images

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|foreign_key: true|

### Association
- belongs_to :item

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address|string|null: false|
|build_name|string|-------|
|phone_number|integer|null: false|
|purchase_id|integer|foreign_key: true|

### Association
- belongs_to :purchase

## creditsテーブル
|Column|Type|Options|
|------|----|-------|
|customer_id|string|-------|
|card_id|string|-------|
|purchase_id|integer|foreign_key: true|

### Association
- belongs_to :purchase

## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|credit_id|integer|null: false, foreign_key: true|
|expiration_date|null: false, foreign_key: true|
|user_id|integer|foreign_key: true|
|item_id|integer|foreign_key: true|

### Association
- has_one :credit
- has_one :address
- belongs_to :user
- belongs_to :item
