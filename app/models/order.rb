class  Order
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number

  with_options presence: true do
    validates :postal_code,       format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid."}
    validates :municipalities,    format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address           
    validates :telephone_number,  format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
end
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code,  prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end
end