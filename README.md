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
has_many :card

## products table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| image              | string              | null: false             |
| name               | string              | null: false             |
| description        | string              | null: false             |
| detail             | string              | null: false             |
| delivery           | string              | null: false             |

### Association

belongs_to :user
belongs_to :card

## card table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| card_id            | string              | null: false             |
| customer_id        | string              | null: false             |

### Association

belongs_to :user