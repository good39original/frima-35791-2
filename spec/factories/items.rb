FactoryBot.define do
  factory :item do
    image           {}
    name            {"hoge"}
    description     {"aaaaa"}
    category_id     {1}
    status_id       {1}
    shipping_id     {3}
    prefecture_id   {1}
    money           {9999999}
    charge_id       {1}
  end
end
