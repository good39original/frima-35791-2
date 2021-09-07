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
| name               | string              | null: false             |
| description        | text                | null: false             |
| detail             | string              | null: false             |
| delivery           | string              | null: false             |
| user               | references          | foreign_key: true       |
| category_id        | integer             | null: false             |
| status_id          | integer             | null: false             |
| shipping_id        | integer             | null: false             |
| area_id            | integer             | null: false             |
| day_id             | integer             | null: false             |

### Association

belongs_to :user
has_one :card

## card table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user               | reference           | foreign_key: true       |
| card               | reference           | foreign_key: true       |

 ## address table

 | Column            | Type                | Option                  |
 | information       | string              | null: false             |
 | deadline          | string              | null: false             |
 | security          | string              | null: false             |
 | postal            | string              | null: false             |
 | prefectures       | string              | null: false             |
 | district          | string              | null: false             |
 | address           | string              | null: false             |
 | build             | string              | null: false             |
 | number            | string              | null: false             |

### Association

belongs_to :user

----------------------------------------------------------------------