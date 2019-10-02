# README

Basic認証→　id：teame、pass：mercari

メールアドレス: test@mail.com 
パスワード: testuser
でログイン可能 

[mercarierd.pdf](https://github.com/yuya0618/freemarket_sample_57e/files/3679634/mercarierd.pdf)

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|text|text||
|firstname|string|null: false|
|lasrname|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null:false|
|phone_number|integer||

### Association
- has_one :profile
- has_one :credit_card
- has_one :adress
- has_many :items
- has_many :likes
- has_many :comments


## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|firstname|string|null: false|
|lasrname|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null:false|
|phone_number|integer||
|user_id|references|null:false, foreign_key: true|

### Association
- belongs_to :user


## addressesテーブル
Column|Type|Options|
|------|----|-------|
|zip_code|integer|null:false|
|address_pref|integer|null: false|
|address_city|string|null:false|
|address_number|string|null:false|
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
|details|string||
|condition|integer|null: false|
|delivery_fee|integer|null:false|
|delivery_method|integer|null:false|
|delivery_location|integer|null:false|
|delivery_term|integer|null:false|
|user_id|refernces|null: false, foreign_key: true|
|category_id|refernces|null: false, foreign_key: true|
|brand_id|references|foreign_key: true|
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
|parent_id|references|foreign_key: true|

### Association
- has_many :items
- has_many :categories_sizes
- has_many :sizes, through: :categories_sizes
- has_many :brands_categories
- has_many :brands, through: :brands_categories

<!-- 自己結合でなく'ancestry'gemを使うことにした -->
<!-- - belongs_to :parent, class_name: 'Category', optional: true
- has_many :children, class_name: 'Category', foreign_key: 'parent_id' -->
has_ancestry

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
|category_id|references|null: false, foreign_key: true|

### Association
- has_many :items
- has_many :categories
- has_many :categories, through: brands_categories

## categories_sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size_id|references|null: false, foreign_key: true|
|category_id|refernces|null: false, foreign_key: true|

### Association
- belongs_to :size
- belongs_to :category

## brands_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|brand_id|references|null: false, foreign_key: true|
|category_id|refernces|null: false, foreign_key: true|

### Association
- belongs_to :brand
- belongs_to :category


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items
- has_many :categories_sizes
- has_many :categories, through: :categories_sizes

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

### Association
- belongs_to :item
- belongs_to :seller
- belongs_to :buyer

## buyersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :reviews
- has_many :orders
## sellersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :reviews
- has_many :orders

## reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|evaluation|integer|null: false|
|text|string||
|buyer_id|references|null: false, foreign_key: true|
|seller_id|refernces|null: false, foreign_key: true|
|order_id|refernces|null: false, foreign_key: true|

### Association
- belongs_to :buyer
- belongs_to :seller
