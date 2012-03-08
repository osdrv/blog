module InheritedResources
  class Application < Base
    respond_to :json, :html
    actions :index, :show
    
    protected
    
    def collection
      get_collection_ivar || set_collection_ivar(end_of_association_chain.all)
    end
  end
end