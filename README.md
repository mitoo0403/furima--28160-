# README

DB設計について

## usersテーブル

| Column        | Type                   | Options                        |
| ------------- | ---------------------- | ------------------------------ |
| nickname      | string                 | null: false                    |
| email         | string                 | null: false, unique: true      |
| password      | encrypted_password     | null: false                    |
| first_name    | string                 | null: false                    |
| first_name(f) | string                 | null: false                    |
| last_name     | string                 | null: false                    |
| last_name(f)  | string                 | null: false                    |
| birthday      | date                   | null: false                    |

### Association
- has_many :items
- has_many :comments
- has_many :orders

## itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | binary     | null: false                    |
| name          | string     | null: false                    |
| explanation   | string     | null: false                    |
| category_id   | integer    | null: false, foreign_key: true |
| status        | integer    | null: false, foreign_key: true |
| delivery_free | integer    | null: false, foreign_key: true |
| area          | integer    | null: false, foreign_key: true |
| days          | integer    | null: false, foreign_key: true |
| price         | integer    | null: false                    |

### Association
- belongs_to :user
- has_many :comments
- has_one :order

 ## commentsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| text          | string     | null: false                    |
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
