class Topic
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Sluggable
  include Mongoid::MultiParameterAttributes

  field :title, :type => String
  field :text, :type => String
  field :tags, :type => Array
  field :is_draft, :type => Boolean, :default => true

  belongs_to :t_blog

  sluggable :slug

  validates_presence_of :t_blog

end
