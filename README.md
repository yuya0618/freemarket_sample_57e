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
- has_many :likes
- has_many :comments



## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|text|string||
|firstname|string|null: false|
|lasrname|string|null: false|
|firstname-kana|string|null: false|
|lastname-kana|string|null: false|
|prefecture|string|null: false|
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

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|expiration_month|integer|null:false|
|user_id|refernces|null: false, foreign_key: true|
|security_code|integer|null: false|

### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|details|string|null: false|
|user_id|refernces|null: false, foreign_key: true|
|category_id|refernces|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|condition|integer|null: false|
|delivery_fee|integer|null:false|
|delivery_method|integer|null:false|
|delivery_location|integer|null:false|
|delivery_term|integer|null:false|
|size_id|references||

### Association
- belongs_to :category
- belongs_to :brand
- belongs_to :user
- belongs_to :size
- has_one :order
- has_many :likes
- has_many :comments
- has_many :images




## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items
- has_many :category_sizes
- has_many :sizes, through: :category_size

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

## category_sizeテーブル
|Column|Type|Options|
|------|----|-------|
|size_id|references|null: false, foreign_key: true|
|category_id|refernces|null: false, foreign_key: true|

### Association
- has_many :item

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items
- has_many :category_size
- has_many :categores, through: :category_size 

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|refernces|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string||
|user_id|references|null: false, foreign_key: true|
|item_id|refernces|null: false, foreign_key: true|

## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|status|integer|null: false|
|item_id|refernces|null: false, foreign_key: true|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|refernces|null: false, foreign_key: :true|


## buyersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|


## sellersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|


## reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|evaluation|integer|null: false|
|text|string||
|buyer_id|references|null: false, foreign_key: true|
|seller_id|refernces|null: false, foreign_key: true|
|order_id|refernces|null: false, foreign_key: true|
