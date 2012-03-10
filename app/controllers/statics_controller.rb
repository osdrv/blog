class StaticsController < InheritedController

  respond_to :html
  
  actions :only => [ :index ]

  protected

  def resource
    @topic ||= resource_class.from_blog( @current_blog ).slugged( params[ :slug ] )
  end

end
