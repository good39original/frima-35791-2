FactoryBot.define do
  factory :item do 
    user_id         {1}
    name            {"hoge"}
    description     {"aaaaa"}
    category_id     {2}
    status_id       {3}
    shipping_id     {4}
    prefecture_id   {5}
    charge_id       {6}
    money           {9999999}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')

      

  end
 end
end