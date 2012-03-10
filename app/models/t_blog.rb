class TBlog
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, :type => String
  field :domain, :type => String
  field :layout, :default => "application"

  has_many :topics

  index :domain, :unique => true

  validates_uniqueness_of :domain
  validates_presence_of :domain
  validates_presence_of :title
end
