class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :charge

  validates :title, :text, presence: true

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }

end