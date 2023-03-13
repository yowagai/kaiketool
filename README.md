# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| child_name         | string  | null: false               |
| child_name_kana    | string  | null: false               |
| parent_name        | string  | null: false               |
| parent_name_kana   | string  | null: false               |
| sex_id             | integer | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :search_histories
- has_many :comments
- has_many :stamps
- has_many :favorites

## search_histories テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| title              | string     | null: false                    |
| background         | text       |                                |
| type_id            | integer    |                                |

### Association

- belongs_to :user
- has_many :comments
- has_many :stamps
- has_many :favorites

## comments テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| search_histories   | references | null: false, foreign_key: true |
| content            | text       |                                |

### Association

- belongs_to :user
- belongs_to :search_histories

## stamps テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| search_histories   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :search_histories

## favorites テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| search_histories   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :search_histories