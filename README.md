# Furimaー27726 DB設計

## userテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|name|string|null: false|
|ruby_name|string|null: false|
|birthday|string|null: false|

### Association
- has_many :items,  <!-- through: :users_groups -->
- has_many :purchase

## itemテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|-------|
|name|string|-------|
|price|integer|-------|
|item_detail|text|-------|
|category|string|-------|
|status|string|-------|
|charge_delivery_fee|text|-------|
|ship_form_area|string|-------|
|days|text|-------|
|user_id|integer|-------|

### Association
- belongs_to :user
- has_one :purchase


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|integer|-------|
|prefectures|----|-------|
|city|----|-------|
|address|----|-------|
|build_name|string|-------|
|phone_number|integer|-------|

### Association
- belongs_to :purchase

## creditテーブル
|Column|Type|Options|
|------|----|-------|
|credit_number|integer|-------|
|expiration_date|date|-------|
|security_code|integer|-------|

### Association
- belongs_to :purchase

## purchaseテーブル
|Column|Type|Options|
|------|----|-------|
|credit_id|integer|null: false, foreign_key: true|
|expiration_date|null: false, foreign_key: true|

### Association
- has_one :credit_number
- has_one :address
- belongs_to :user
- belongs_to :item

<!-- ## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :users_groups
- has_many :users,  through: :users_groups
- has_many :messages

## users_groupsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belong_to :user
- belong_to :group -->