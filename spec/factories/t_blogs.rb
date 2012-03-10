# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :t_blog do
    title Factory.next( :string )
    domain Factory.next( :domain )
  end
end
