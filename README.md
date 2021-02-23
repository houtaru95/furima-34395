# テーブル設計

## users テーブル

| Column           | Type    | Options                   |
| ---------------- | --------| ------------------------- |
| email            | string  | null: false, unique: true |
| password         | string  | null: false               |
| nickname         | string  | null: false, unique: true |
| family_name      | string  | null: false               |
| first_name       | string  | null: false               |
| family_name_kana | string  | null: false               |
| first_name_kana  | string  | null: false               |
| birth_year       | integer | null: false               |
| birth_month      | integer | null: false               |
| birth_day        | integer | null: false               |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | -----------| ------------------------------ |
| image            | string     | null: false,                   |
| item_name        | string     | null: false                    |
| item_description | text       | null: false                    |
| item_category    | string     | null: false                    |
| shipping_fee     | string     | null: false                    |
| shipping_from    | string     | null: false                    |
| shipping_days    | string     | null: false                    |
| item_price       | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_many :destinations


## destinations テーブル

| Column           | Type       | Options                        |
| ---------------- | -----------| -------------------------------|
| postal_code      | integer    | null: false,                   |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| tell_number      | string     | null: false, unique: true      |
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to :order

