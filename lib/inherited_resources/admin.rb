module InheritedResources
  class Admin < Base
    respond_to :json, :html
    before_filter :authenticate_user!
    layout "admin"

    rescue_from Mongoid::Errors::DocumentNotFound, :with => :document_not_found
  
    def document_not_found
      render :status => 404, :template => "errors/admin404"
    end
  end
end