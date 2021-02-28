FactoryBot.define do
  factory :item do
    item_name           { 'test' }
    item_description    { 'aaaaaaaa' }
    item_category_id    { 3 }
    item_condition_id   { 4 }
    shipping_fee_id     { 2 }
    shipping_place_id   { 27 }
    shipping_days_id    { 3 }
    item_price          { 10_000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
