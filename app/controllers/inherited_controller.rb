class InheritedController < InheritedResources::Base
  respond_to :json, :html

  before_filter :define_blog!

  def define_blog!
    @current_blog = TBlog.for_domain( request.host.to_s )
    raise "Unknown host" if @current_blog.nil?
    self.class.send( :layout, @current_blog.layout )
    I18n.locale = @current_blog.locale.to_sym
  end

end