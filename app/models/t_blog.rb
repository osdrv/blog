class TBlog
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title, :type => String
  field :domain, :type => String

  has_many :topics
end
