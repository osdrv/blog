class TopicsController < InheritedController
  before_filter :define_blog!

  def define_blog!
    @current_blog = TBlog.for_domain( request.host.to_s )
    raise "Unknown host" if @current_blog.nil?
    self.class.send( :layout, @current_blog.layout )
  end  
end
