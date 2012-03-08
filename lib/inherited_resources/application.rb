module InheritedResources
  class Application < Base
    respond_to :json, :html
    actions :index, :show
  end
end