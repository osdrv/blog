class InheritedController < InheritedResources::Base
  respond_to :json, :html

  before_filter :define_blog!

  def define_blog!
    @current_blog = TBlog.for_domain( request.host.to_s )
    raise "Unknown host" if @current_blog.nil?
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
    )
  end
end