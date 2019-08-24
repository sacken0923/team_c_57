##  usersテーブル
|Colum|Type|Option|
|-----|----|------|
|nickname|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|kana_first_name|string|null: false|
|kana_last_name|string|null: false|
|year|integer|null: false|
|month|integer|null: false|
|day|integer|null: false|
|tel|string|nullfalse|
|city|string|null: false|
|adress|string|null: false|
|building|string||
|home_tel|string||

### Association
- has_many :items
- has_one :profile
- has_one :card



## itemsテーブル
|column|Type|Option|
|------|----|------|
|name|string|null: false|
|price|integer|null: false|
|description|text|null: false|
|state|string|null: false|
|delivery_fee|integer|null: false|
|shipping_method|string|null: false|
|shipping_time|string|null_false|
|like|integer||
|seller_id|integer|null: false|
|buyer_id|integer||

### Association
- belongs_to :user
- belongs_to :brand
- belongs_to :category
- has_many :photos
- has_many :comments

## categorysテーブル
|column|Type|Option|
|------|----|------|
|name|string|null: false|
|ancestry|integer||

### Association
- has_many :items


## brandsテーブル
|column|TYpe|OPtion|
|------|----|------|
|name|string|null: false|
|item_id|integer||

### Association
- has_many :items

## photosテーブル
|column|Type|Option|
|------|----|------|
|image|string|null: false|
|item_id|integer|null: false|

### Association
- belongs_to :item

## commentsテーブル
|column|Type|Option|
|------|----|------|
|comment|text|null: false|
|user_id|integer|null: false|
|item_id|integer|null: false|

### Association
- belongs_to :item

## profilesテーブル
|column|Type|Option|
|------|----|------|
|image|string||
|text|text||
|user_id|integer|null: flase|
 
### Association
- belongs_to user

## cardsテーブル
|column|Type|Option|
|------|----|------|
|number|string|null: false|
|limit_month|integer|null: false|
|limit_year|integer|null: false|
|code|integer|null: false|

### Association
- belongs_to user
