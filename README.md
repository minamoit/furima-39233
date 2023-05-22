## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| first_name         | string  | null: false              |
| last_name          | string  | null: false              |
| first_name(kana)   | string  | null: false              |
| last_name(kana)    | string  | null: false              |
| date_of_birth      | integer | null: false              |
| nickname           | string  | null: false              |
| email              | string  | null: false, unique: true|
| encrypted_password | string  | null: false              |

# Association

 - has_many :items



## items テーブル

| Column          | Type    | Options                       |
| --------------- | ------- | ----------------------------- |
| item_name       | string  | null: false                   |
| category        | string  | null: false                   |
| description     | text    | null: false                   |
| condition       | string  | null: false                   |
| shipping_cost   | integer | null: false                   |
| shipping_origin | string  | null: false                   |
| shipping_date   | string  | null: false                   |
| price           | integer | null: false                   |
| sales_profit    | integer | null: false                   |
| user_id         | integer | null: false,foreign_key: true |
# Association

 - belongs_to :user
 - belongs_to :purchase



# purchase テーブル

| Column         | Type     | Options                       |
| -------------- | -------- | ----------------------------- |
| purchase_id    | integer  | null: false,primary_key: true |
| item_id        | integer  | null: false,foreign_key: true |
| buyer_name     | string   | null: false                   |
| purchase_date  | integer  | null: false                   |
| purchase_price | integer  | null: false                   |
| shipping_fee   | integer  | null: false                   |
| total_payment  | integer  | null: false                   |
| seller_profit  | integer  | null: false                   |

# Association

 - has_many :items
 - has_one :purchase_information
 - has_one :card_information



# purchase_information テーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| user_id      | integer | null: false,foreign_key: true  |
| address_line | string  | null: false                    |
| city         | string  | null: false                    |
| prefecture   | string  | null: false                    |
| postal_code  | integer | null: false                    |
| telephone    | integer | null: false                    |



# card_information テーブル

| Column          | Type    | Options                       |
| --------------- | ------- | ----------------------------- |
| payment_id      | integer | null: false,primary_key: true |
| purchase_id     | integer | null: false,foreign_key: true |
| cardholder_name | string  | null: false                   |
| card_number     | integer | null: false                   |
| expiration_date | integer | null: false                   |
| security_code   | integer | null: false                   |
| billing_address | text    | null: false                   |
| payment_date    | integer | null: false                   |
| payment_amount  | integer | null: false                   |
