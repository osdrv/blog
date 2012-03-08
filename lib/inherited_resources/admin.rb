module InheritedResources
  class Admin < Base
    respond_to :json, :html
    before_filter :authenticate_jedi!
    layout "admin"

    rescue_from Mongoid::Errors::DocumentNotFound, :with => :document_not_found
  
    def document_not_found
      render :status => 404, :template => "errors/admin404"
    end

    protected

    def collection
      get_collection_ivar || set_collection_ivar(end_of_association_chain.all)
    end
    
  end
end