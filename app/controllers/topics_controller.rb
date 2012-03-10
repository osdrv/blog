class TopicsController < InheritedController
  
  has_scope :tag

  protected

  def collection
    @topics ||= super.active.from_blog( @current_blog ).desc( :created_at )
  end

  def resource
    @topic ||= resource_class.active.from_blog( @current_blog ).slugged( params[ :slug ] )
  end
end
