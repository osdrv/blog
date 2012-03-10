class Editor::TopicsController < Editor::AdminController
  
  protected

  def collection
    @topics ||= super.desc( :created_at )
  end
end
