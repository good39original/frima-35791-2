FactoryBot.define do
  factory :order do
    postal_code      {'123-4567'}
    prefecture_id    {0}
    municipalities   {'東京都'}
    address          {'1-1'}
    building_name    {'東京ハイツ'}
    telephone_number {"0312345678"}
    user_id          {1}
    item_id          {1}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
