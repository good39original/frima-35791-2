class Address < ApplicationRecord
  belongs_to :card
  belongs_to :item
end
