# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| -------------------| --------| ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| family_name_kana   | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birth_day          | date    | null: false               |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | -----------| ------------------------------ |
| item_name         | string     | null: false                    |
| item_description  | text       | null: false                    |
| item_category_id  | integer    | null: false                    |
| item_condition_id | integer    | null: false                    |
| shipping_fee_id   | integer    | null: false                    |
| shipping_place_id | integer    | null: false                    |
| shipping_days_id  | integer    | null: false                    |
| item_price        | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |


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
- has_one :destination


## destinations テーブル

| Column            | Type       | Options                        |
| ----------------- | -----------| -------------------------------|
| postal_code       | string     | null: false                    |
| shipping_place_id | integer    | null: false                    |
| city              | string     | null: false                    |
| address           | string     | null: false                    |
| building_name     | string     |                                |
| tell_number       | string     | null: false                    |
| order             | references | null: false, foreign_key: true |

### Association

- belongs_to :order

