# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |
| family_name        | string              | null: false             |
| first_name         | string              | null: false             |
| family_name_kana   | string              | null: false             |
| first_name_kana    | string              | null: false             |
| birth_day          | date                | null: false             |

### Association

has_many :products
has_many :cards

## products table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
|               ||
| name               | string              | null: false             |
| description        | text                | null: false             |
| detail             | string              | null: false             |
| delivery           | string              | null: false             |
| user               | references          | foreign_key: true       |

### Association

belongs_to :user
belongs_to :card

## card table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| card_id            | string              | null: false             |
| customer_id        | string              | null: false             |
| user               | reference           | foreign_key: true       |
| card               | reference           | foreign_key: true       |

### Association

belongs_to :user

----------------------------------------------------------------------