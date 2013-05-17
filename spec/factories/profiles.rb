# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    first_name {Faker::Name.first_name} 
    last_name {Faker::Name.last_name} 
    nick_name "Banti"
    contact_number { Faker::PhoneNumber.phone_number}
    date_of_birth "02/04/1992"
    city  {Faker::Address.city}
    state { Faker::Address.state}
    country { Faker::Address.country}
    permanent_address "sai apartment flat No. 8, shivaji park ahamadnagar 422034"
    local_address "flat No. 3, gokhale park, tingare nagar 411032"
    facebook "tushar.jadhav"
    twitter_handle "tushar"
  end
end
