# README

# テーブル設計

## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false, unique: true      |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
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
<!-- # addressesテーブルとのアソシエーション -->
- has_one :address

<!-- アクティブハッシュで性別（男性、女性、その他）を選択する（セレクトボックス） -->
<!-- 一人のユーザーは一つの住所を持つ -->

## membership_plans テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| monthly_fee_id | integer | null: false |
| yearly_fee_id  | integer | null: false |

### Association

<!-- # usersテーブルとのアソシエーション -->

- has_one :user

<!-- アクティブハッシュで月額、年額を選択する（セレクトボックス） -->

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
