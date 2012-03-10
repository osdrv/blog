# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    title Factory.next( :string )
    text Factory.next( :string )
    tags %w(tag1 tag2 tag3)
  end
end
