FactoryBot.define do
  factory :item do
    name                {'aaaaaa'}
    explanation         {'aaaaaa'}
    category_id         {1}
    status_id           {1}
    delivery_free_id    {1}
    area_id             {1}
    day_id              {1}
    price               {1000}
    user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end