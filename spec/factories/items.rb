FactoryBot.define do
  factory :item do
    item_name       { 'パソコン' }
    description     { '3年前に購入したMacBookです' }
    category_id           { 2 }
    condition_id          { 2 }
    shipping_cost_id      { 2 }
    shipping_origin_id         { 2 }
    shipping_date_id      { 2 }
    price           { 50000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
