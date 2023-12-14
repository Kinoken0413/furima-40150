# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                   | Type    | Options     |
| ------------------------ | ------- | ----------- |
| item_name                | string  | null: false |
| item_explanation         | text    | null: false |
| item_sales_status        | string  | null: false |
| item_shipping_fee_status | string  | null: false |
| item_prefecture          | string  | null: false |
| item_scheduled_delivery  | string  | null: false |
| item_price               | integer | null: false |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliveries テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| order              | references | null: false, foreign_key: true |
| postal_code        | string     | null: false                    |
| prefecture         | string     | null: false                    |
| addresses          | string     | null: false                    |
| building           | string     |                                |
| phone_number       | integer    | null: false                    |

### Association

- belongs_to : order
