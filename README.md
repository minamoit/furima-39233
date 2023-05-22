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

 - has_many :item
 - has_many :purchase



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

 - belongs_to :user
 - has_one :purchase



# purchases テーブル

| Column         | Type     | Options                       |
| -------------- | -------- | ----------------------------- |
| item_id        | integer  | null: false,foreign_key: true |
| user_id        | integer  | null: false,foreign_key: true |


# Association

 - belongs_to :item
 - belongs_to :user
 - has_one :purchase_information




# purchase_informationｓ テーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| purchase_id   | integer | null: false,foreign_key: true  |
| building_name | string  |                                |
| address_line  | string  | null: false                    |
| city          | string  | null: false                    |
| prefecture_id | integer | null: false                    |
| postal_code   | string  | null: false                    |
| telephone     | string  | null: false                    |


belongs_to :purchase
