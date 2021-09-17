class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :charge
  has_one_attached :image
  belongs_to :user

  validates :image,         presence: true
  validates :name,          presence: true        
  validates :description,   presence: true
  validates :money,         presence: true 
  validates :money,         numericality:  { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
  validates :status_id,     numericality:  { other_than: 1 , message: "can't be blank" }
  validates :category_id,   numericality:  { other_than: 1 , message: "can't be blank" }
  validates :shipping_id,   numericality:  { other_than: 1 , message: "can't be blank" }
  validates :prefecture_id, numericality:  { other_than: 1 , message: "can't be blank" }
  validates :charge_id,     numericality:  { other_than: 1 , message: "can't be blank" }

end