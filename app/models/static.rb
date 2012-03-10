class Static
  include Mongoid::Document
  include Mongoid::Sluggable
  
  field :title, :type => String
  field :keywords, :type => String
  field :meta, :type => String
  field :left, :type => String
  field :right, :type => String

  belongs_to :t_blog

  sluggable :slug do |topic|
    Russian.translit topic.title
  end

  validates_presence_of :title
  validates_presence_of :t_blog

  scope :from_blog, ->( blog ) {
    blog_id = ( blog.is_a? TBlog ) ? blog.id.to_s : blog.to_s
    where( :t_blog_id => blog_id )
  }
  
end
