# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_one :profile
- has_one :credit_card
- has_many :items


## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|firstname|string|null: false|
|lasrname|string|null: false|
|firstname-kana|string|null: false|
|lastname-kana|string|null: false|
|firstname|string|null: false|
|lasrname|string|null: false|
|first_name_kana|string|null: false|
|zipcode|string|null: false|
|prefecture|string|null: false|
|first_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null:false|
|phone_number|integer||
|zip_code|integer|null:false|
|adress_pref|integer|null: false|
|adress_city|string|null:false|
|adress_number|string|null:false|
|building|string||
|user_id|references|null:false, foreign_key: true|

### Association
- belongs_to :user

## credit_cardテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|expiration_month|integer|null: false|
|expiration_month|integer|null:false|
|user_id|refernces|null: false, foreign_key: true|

### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|user_id|refernces|null: false, foreign_key: true|
|category_id|refernces|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|condition|integer|null: false|
|delivery_fee|integer|null:false|
|delivery_method|integer|null:false|
|delivery_location|integer|null:false|
|delivery_term|integer|null:false|

### Association
- belongs_to :category
- has_many :brands
- belongs_to :user


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|refernces|null: false, foreign_key: true|

### Association
- has_many :item
- belongs_to :user

## ~~テーブル
|Column|Type|Options|
|------|----|-------|
||integer|null: false, foreign_key: true|
||integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## ~~テーブル
|Column|Type|Options|
|------|----|-------|
||integer|null: false, foreign_key: true|
||integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## ~~テーブル
|Column|Type|Options|
|------|----|-------|
||integer|null: false, foreign_key: true|
||integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## ~~テーブル
|Column|Type|Options|
|------|----|-------|
||integer|null: false, foreign_key: true|
||integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## ~~テーブル
|Column|Type|Options|
|------|----|-------|
||integer|null: false, foreign_key: true|
||integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## ~~テーブル
|Column|Type|Options|
|------|----|-------|
||integer|null: false, foreign_key: true|
||integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user