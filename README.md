## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| name               | string | null: false              |
| nickname           | string | null: false              |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false              |

# Association

 - has_many :items



## items テーブル

| Column         | Type       | Options                  |
| -------------- | ---------- | ------------------------ |
| item_name      | string     | null: false              |
| price          | string     | null: false              |
| category       | string     | null: false              |
| brand          | string     | null: false              |
| user           | references | null: false              |

# Association

 - belongs_to :user
 - belongs_to :buyer



# buyer テーブル

| Column         | Type       | Options                  |
| -------------- | ---------- | ------------------------ |
| name           | string     | null: false              |
| email          | string     | null: false, unique: true|
| phone_number	 | string     | null: false              |
| user           | references | null: false              |

# Association

 - has_many :items
 - has_one :shipping_address
 - has_one :card



# shipping_address テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false,foreign_key: true  |
| post_code  | string     | null: false                    |
| address    | text       | null: false                    |



# card テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| card       | references | null: false, foreign_key: true |
