# README

# テーブル設計

## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false, unique: true      |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false, unique: true      |
| family_name        | string     | null: false                    |
| first_name         | string     | null: false                    |
| family_name_kana   | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| gender_id          | integer    | null: false                    |
| birth_date         | date       | null: false                    |
| phone_number       | string     | null: false                    |
| membership_plan    | references | null: false, foreign_key: true |

### Association

<!-- # membership_plansテーブルとのアソシエーション -->

- belongs_to :membership_plan
<!-- # membership_paymentsテーブルとのアソシエーション -->
- has_many :membership_payments

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| street_address | string     | null: false                    |
| building       | string     |                                |
| user           | references | null: false, foreign_key: true |

### Association

<!-- # usersテーブルとのアソシエーション -->

- belongs_to :user

## membership_plans テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| monthly_fee_id | integer | null: false |
| yearly_fee_id  | integer | null: false |

### Association

<!-- # usersテーブルとのアソシエーション -->

- has_many :user

## membership_payments テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| membership_plan | references | null: false, foreign_key: true |

### Association

<!-- # usersテーブルとのアソシエーション -->

- belongs_to :user
<!-- # membership_planテーブルとのアソシエーション -->
- belongs_to :membership_plan
