## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| first_name         | string  | null: false              |
| last_name          | string  | null: false              |
| first_name_kana    | string  | null: false              |
| last_name_kana     | string  | null: false              |
| date_of_birth      | date    | null: false              |
| nickname           | string  | null: false              |
| email              | string  | null: false, unique: true|
| encrypted_password | string  | null: false              |

# Association

 - has_many :items
 - has_many :purchases



## items テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| item_name          | string     | null: false                   |
| category_id        | integer    | null: false,foreign_key: true |
| description        | text       | null: false                   |
| condition_id       | integer    | null: false                   |
| shipping_cost_id   | integer    | null: false                   |
| shipping_origin_id | integer    | null: false                   |
| shipping_date_id   | integer    | null: false                   |
| price              | integer    | null: false                   |
| user               | references | null: false,foreign_key: true |

# Association

 - belongs_to :users
 - has_one :purchases



# purchases テーブル

| Column         | Type     | Options                       |
| -------------- | -------- | ----------------------------- |
| item_id        | integer  | null: false,foreign_key: true |
| user_id        | integer  | null: false,foreign_key: true |
| purchase_date  | integer  | null: false                   |
| purchase_price | integer  | null: false                   |
| shipping_fee   | integer  | null: false                   |
| total_payment  | integer  | null: false                   |
| seller_profit  | integer  | null: false                   |

# Association

 - belongs_to :items
 - has_one :purchase_informations



# purchase_informationｓ テーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| purchase_id  | integer | null: false,foreign_key: true  |
| building_name| string  |                                |
| address_line | string  | null: false                    |
| city         | string  | null: false                    |
| prefecture   | string  | null: false                    |
| postal_code  | integer | null: false                    |
| telephone    | integer | null: false                    |


belongs_to :purchases
