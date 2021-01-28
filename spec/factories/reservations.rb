require 'date'
require 'time'
FactoryBot.define do
  factory :reservation do
    date                  {Date.today}
    time                  {DateTime.now + (60*60*7)}
    n_people              {3}
    
  association :user
  association :shop
  end
end