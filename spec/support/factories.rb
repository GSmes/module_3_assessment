FactoryGirl.define do
  factory :item do
    name { generate :name }
    description('What a nice item')
    image_url('http://www.url.com')
  end

  sequence :name do |n|
    "Cool Item #{n}"
  end
end
