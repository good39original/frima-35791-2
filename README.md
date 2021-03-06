# DB 設計

## users table

| Column             | Type                | Options                              |
|--------------------|---------------------|--------------------------------------|
| nickname           | string              | null: false                          |
| email              | string              | unique: true, null: false            |
| encrypted_password | string              | null: false                          |
| family_name        | string              | null: false                          |
| first_name         | string              | null: false                          |
| family_name_kana   | string              | null: false                          |
| first_name_kana    | string              | null: false                          |
| birth_day          | date                | null: false                          |

### Association

has_many :items
has_many :cards

## items table

| Column             | Type                | Options                              |
|--------------------|---------------------|--------------------------------------|
| name               | string              | null: false                          |
| description        | text                | null: false                          |
| user               | references          | foreign_key: true, null: false       |
| category_id        | integer             | null: false                          |
| status_id          | integer             | null: false                          |
| shipping_id        | integer             | null: false                          |
| prefecture_id      | integer             | null: false                          |
| money              | integer             | null: false                          |
| charge_id          | integer             | null: false                          |

### Association

belongs_to :user
has_one :card

## cards table

| Column             | Type                | Options                             |
|--------------------|---------------------|-------------------------------------|
| user               | references          | foreign_key: true, null:false       |
| item               | references          | foreign_key: true, null:false       |

### Association

belongs_to: item
has_one: address
belongs_to: user

 ## addresses table

| Column            | Type                | Option                               |
|-------------------|---------------------|--------------------------------------|
| postal_code       | string              | null: false                          |
| prefecture_id     | integer             | null: false                          |
| municipalities    | string              | null: false                          |
| address           | string              | null: false                          |
| building_name     | string              |                                      | 
| telephone_number  | string              | null: false                          |
| card              | references          | foreign_key_true, null: false        |

### Association

belongs_to :card

