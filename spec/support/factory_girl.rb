require 'factory_girl'
require 'date'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :project do
    sequence(:company_name) {|n| "Company #{n}"}
    sequence(:company_city) {|n| "City #{n}"}
    sequence(:company_state) {|n| "Location #{n}"}
    sequence(:start_date) { |n| Time.now - (n+rand(2..60)).months }
    sequence(:end_date) { |n| Time.now - (n+rand(0..2)).months }
    title "Full-Stack Web Developer"
    user
  end

  factory :admin, class: User do
  end
end
