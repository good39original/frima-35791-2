class  Order
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number, :token
  
  with_options presence: true do
    validates :token
    validates :postal_code,      format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :prefecture_id,    numericality: { other_than: 1 , message: "can't be blank" }
    validates :municipalities    
    validates :address               
    validates :telephone_number
    validates :user_id
    validates :item_id
end
    validates :telephone_number, length: { maximum: 11, message: "is too long" }
    validates :telephone_number, length: { minimum: 10, message: "is too short" }
    validates :telephone_number, numericality: { message: 'is invalid. Input only number' }  

  def save
    card = Card.create(item_id: item_id, user_id: user_id) 
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number, card_id: card.id)
  end
end

