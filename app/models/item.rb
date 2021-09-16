class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :charge
  has_one_attached :image

  validates :image,         presence: true
  validates :name,          presence: true        
  validates :description,   presence: true
  validates :money,         presence: true
  validates :money,         numericality: { other_than: 1 , message: "is invalid. Input half-width characters" }
  validates :money,         numericality: { other_than: 1 , message: "is out of setting range" }
  validates :status_id,     presence: true
  validates :category_id,   presence: true
  validates :shipping_id,   numericality: { other_than: 1 , message: "fee status can't be blank" }
  validates :prefecture_id, presence: true
  validates :charge_id,     presence: true
  

end