class TopicsController < InheritedController
  protected

  def collection
    @topics ||= super.active.from_blog( @current_blog )
  end
end
