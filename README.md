## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| first_name         | string  | null: false              |
| last_name          | string  | null: false              |
| first_name_kana    | string  | null: false              |
| last_name_kana     | string  | null: false              |
| birth_day          | date    | null: false              |
| nickname           | string  | null: false              |
| email              | string  | null: false,unique: true |
| encrypted_password | string  | null: false,unique: true |

# Association

 - has_many :items
 - has_many :purchases



## items テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| item_name          | string     | null: false                   |
| category_id        | integer    | null: false                   |
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

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| item        | references | null: false,foreign_key: true |
| user        | references | null: false,foreign_key: true |


# Association

 - belongs_to :item
 - belongs_to :user
 - has_one :address



# address テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| purchase           | references | null: false,foreign_key: true  |
| postal_code        | string     | null: false                    |
| shipping_origin_id | integer    | null: false                    |
| city               | string     | null: false                    |
| building_name      | string     |                                |
| house_number       | string     | null: false                    |
| telephone          | string     | null: false                    |

# Association

 - belongs_to :purchase
