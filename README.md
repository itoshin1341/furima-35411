## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |

### Association

- has_many :items
- has_many :purchasers

## items テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| item_name | string     | null: false |
| category  | string     | null: false |
| price     | string     | null: false |
| user      | references |             |

### Association

- belongs_to :users
- belongs_to :purchasers

##  purchasersテーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| amount    | integer    | null: false |
| price     | string     | null: false |
| password  | string     | null: false |
| user      | references |             |

### Association

- belongs_to :users
- belongs_to :purchasers
- has_one :purchasers_address

##  purchasers_addressテーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| amount    | integer    | null: false |
| price     | string     | null: false |
| password  | string     | null: false |
| user      | references |             |

### Association

- belongs_to :purchasers