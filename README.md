# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- belongs_to :group
- belongs_to :user

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|firstname|string|null: false|
|lasrname|string|null: false|
|firstname-kana|string|null: false|
|lastname-kana|string|null: false|
|firstname|string|null: false|
|lasrname|string|null: false|
|first-name-kana|string|null: false|
|zipcode|string|null: false|
|prefecture|string|null: false|
|first-name-kana|string|null: false|


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