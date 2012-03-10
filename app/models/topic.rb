class Topic
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Sluggable
  include Mongoid::MultiParameterAttributes

  field :title, :type => String
  field :text, :type => String
  field :tags, :type => Array
  field :is_draft, :type => Boolean, :default => true

  validates_presence_of :slug

  belongs_to :t_blog

  sluggable :slug do |topic|
    Russian.translit topic.title
  end

  validates_presence_of :title
  validates_presence_of :t_blog

  scope :active, where( :is_draft.ne => true )
  scope :from_blog, ->( blog ) {
    blog_id = ( blog.is_a? TBlog ) ? blog.id.to_s : blog.to_s
    where( :t_blog_id => blog_id )
  }
  scope :tag, ->( tag ) { any_in( :tags => [ tag ] ) }

  alias :base_tags= :tags=
  def tags=( tags )
    tags = tags.split(/\,\s*/).compact if tags.is_a?( String )
    self.base_tags = tags
  end
end
