## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| last_name        | string | null: false |
| first_name       | string | null: false |
| last_name_kana   | string | null: false |
| first_name_kana  | string | null: false |
| year             | string | null: false |
| month            | string | null: false |
| day              | string | null: false |

### Association

- has_many :items
- has_many :purchaser_histories

## items テーブル

| Column                    | Type       | Options     |
| ------------------------- | ---------- | ----------- |
| user                      | references |             |
| category_id               | integer    | null: false |
| product_stats_id          | integer    | null: false |
| delivery_change_burden_id | integer    | null: false |
| prefecture_id             | integer    | null: false |
| delivery_date_id          | integer    | null: false |
| product_name              | string     | null: false |
| product_description       | string     | null: false |
| delivery_cost             | string     | null: false |

### Association

- belongs_to :users
- belongs_to :purchaser_histories

##  purchasers テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| postal_code      | string     | null: false |
| prefecture_id    | integer    | null: false |
| city             | string     | null: false |
| block            | string     | null: false |
| building_name    | string     | null: false |
| phone_number     | string     | null: false |
| purchase_history | string     | null: false |

### Association

- belongs_to :users
- belongs_to :purchasers
- has_one :purchasers_histories

##  purchasers_histories テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| user      | references |             |
| price     | references |             |

### Association

- belongs_to :purchasers