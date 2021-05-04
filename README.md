## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | unique: true, null: false |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :purchaser_histories

## items テーブル

| Column                    | Type       | Options                       |
| --------------------------| ---------- | ----------------------------- |
| user                      | references | null: false, foreign_key:true |
| category_id               | integer    | null: false                   |
| product_stats_id          | integer    | null: false                   |
| delivery_change_burden_id | integer    | null: false                   |
| prefecture_id             | integer    | null: false                   |
| delivery_date_id          | integer    | null: false                   |
| product_name              | string     | null: false                   |
| product_description       | text       | null: false                   |
| price                     | integer    | null: false                   |

### Association

- belongs_to :user
- belongs_to :purchaser_history

##  purchasers テーブル

| Column           | Type      | Options                       |
| ---------------- | --------- | ----------------------------- |
| postal_code      | string    | null: false                   |
| prefecture_id    | integer   | null: false                   |
| city             | string    | null: false                   |
| block            | string    | null: false                   |
| building_name    | string    |                               |
| phone_number     | string    | null: false                   |
| purchase_history | reference | null: false, foreign_key:true |

### Association

- belongs_to :purchasers_history

##  purchasers_histories テーブル

| Column    | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| user      | references | null: false, foreign_key:true |
| item      | references | null: false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :purchaser