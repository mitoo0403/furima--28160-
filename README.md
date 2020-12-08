# README

DB設計について

## usersテーブル

| Column                   | Type       | Options                   |
| ------------------------ | ---------- | ------------------------- |
| nickname                 | string     | null: false               |
| email                    | string     | null: false, unique: true |
| encrypted_password       | string     | null: false               |
| first_name               | string     | null: false               |
| first_name_kana          | string     | null: false               |
| last_name                | string     | null: false               |
| last_name_kana           | string     | null: false               |
| birthday                 | date       | null: false               |

### Association
- has_many :items
- has_many :comments
- has_many :orders

## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| delivery_free_id | integer    | null: false                    |
| area_id          | integer    | null: false                    |
| days_id          | integer    | null: false                    |
| price            | integer    | null: false                    |
| user_id          | integer    | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- has_one :order

 ## commentsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| text          | text       | null: false                    |
| user_id       | integer    | null: false, foreign_key: true |
| item_id       | integer    | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item

 ## orderテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_id       | integer    | null: false, foreign_key: true |
| user_id       | integer    | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :address

 ## addresses

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| postcode      | string      | null: false                    |
| prefecture_id | integer     | null: false                    |
| municipality  | string      | null: false                    |
| address       | string      | null: false                    |
| building_name | string      |                                |
| tel           | string      | null: false                    |
| order_id      | integer     | null: false, foreign_key: true |

- belongs_to :order

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
