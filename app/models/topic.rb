class Topic
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Sluggable
  include Mongoid::MultiParameterAttributes

  field :title, :type => String
  field :text, :type => String
  field :tags, :type => Array
  field :draft, :type => Boolean, :default => true

  belongs_to :t_blog

  sluggable :slug
  
end
