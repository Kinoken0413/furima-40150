FactoryBot.define do
  factory :item do
    item_name { Faker::Commerce.product_name[0...40] }
    item_explanation {Faker::Lorem.sentence[0...1000]}
    category_id { Faker::Number.between(from: 2, to: 11) }
    sales_status_id { Faker::Number.between(from: 2, to: 7) }
    shipping_fee_status_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    scheduled_delivery_id { Faker::Number.between(from: 2, to: 3) }
    item_price { Faker::Number.between(from: 300, to: 9999999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
