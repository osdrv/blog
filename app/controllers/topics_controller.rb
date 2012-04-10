class TopicsController < InheritedController
  
  has_scope :tag
  has_scope :page, :default => 1

  protected

  def collection
    @topics ||= super.active.from_blog( @current_blog ).desc( :created_at )
  end

  def resource
    @topic ||= resource_class.active.from_blog( @current_blog ).slugged( params[ :slug ] )
    raise NotFoundException if @topic.nil?
    @topic
  end
end
