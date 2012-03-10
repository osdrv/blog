Factory.sequence(:int) { |n| n }
Factory.sequence(:field) { |n| "field#{n}" }
Factory.sequence(:string) { |n| "simple string ##{n}" }
Factory.sequence(:date) { |n| Date.today + n.days }
Factory.sequence(:time) { |n| Time.now + n.days }
Factory.sequence(:email) { |n| "john_#{n}@doe.com" }
Factory.sequence(:domain) { |n| "john-#{n}doe.com" }
