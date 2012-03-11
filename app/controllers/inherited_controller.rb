class InheritedController < InheritedResources::Base
  
  class NotFoundException < Exception ; end

  respond_to :json, :html

  before_filter :define_blog!

  def define_blog!
    @current_blog = TBlog.for_domain( request.host.to_s )
    raise NotFoundException if @current_blog.nil?
    self.class.send( :layout, @current_blog.layout )
    I18n.locale = @current_blog.locale.to_sym
    if controller_views_dir.grep(/#{action_name}\.#{@current_blog.layout}/).any?
      request.format = @current_blog.layout.to_sym
    end
  end

  def app_root
    ::Rails.root.to_s
  end

  def controller_views_dir
    Dir.new(
      File.expand_path(
        File.join(
          app_root,
          "app",
          "views",
          self.controller_name
        )
      )
    ) rescue []
  end

  [ActionController::RoutingError, NotFoundException].each do |e|
    rescue_from(e, :with => :response_404)
  end

  %w(403 404 500).each do |status|
    define_method("response_#{status}") do
      response.headers["Connection"] = "close"
      params[:format] ||= "html"
      if params[:format].to_s == "html"
        render :status => status, :template => "errors/#{status}", :layout => false
      else
        render :status => status, :text => ""
      end
    end
  end
end