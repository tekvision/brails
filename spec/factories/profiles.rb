# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    first_name {Faker::Name.first_name} 
    last_name {Faker::Name.last_name} 
    nick_name "Banti"
    contact_number "+919881234235"
    date_of_birth "02/04/1992"
    country "India"
    state "Maharashtra"
    city "Ahamadnagar"
    permanent_address "sai apartment flat No. 8, shivaji park ahamadnagar 422034"
    local_address "flat No. 3, gokhale park, tingare nagar 411032"
    facebook "tushar.jadhav"
    twitter_handle "tushar"
  end
end
