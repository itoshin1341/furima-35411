## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| date               | string | null: false |

### Association

- has_many :items
- has_many :purchaser_histories

## items テーブル

| Column                    | Type       | Options          |
| ------------------------- | ---------- | ---------------- |
| user                      | references | foreign_key:true |
| category_id               | integer    | null: false      |
| product_stats_id          | integer    | null: false      |
| delivery_change_burden_id | integer    | null: false      |
| prefecture_id             | integer    | null: false      |
| delivery_date_id          | integer    | null: false      |
| product_name              | string     | null: false      |
| product_description       | string     | null: false      |
| delivery_cost             | string     | null: false      |

### Association

- belongs_to :users
- has_one :purchaser_histories

##  purchasers テーブル

| Column           | Type       | Options          |
| ---------------- | ---------- | ---------------- |
| postal_code      | string     | null: false      |
| prefecture_id    | integer    | null: false      |
| city             | string     | null: false      |
| block            | references | foreign_key:true |
| building_name    | references | foreign_key:true |
| phone_number     | references | foreign_key:true |
| purchase_history | references | foreign_key:true |

### Association

- belongs_to :users
- belongs_to :purchasers
- belongs_to :purchasers_histories

##  purchasers_histories テーブル

| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| user      | references |                   |
| price     | references | foreign_key:true  |

### Association

- belongs_to :purchasers