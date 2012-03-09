class Edit::AdminController < InheritedResources::Base
  
  include InheritedResources::SociableGuy
  
  respond_to :json, :html
  before_filter :authenticate_jedi!, :set_locale
  layout "admin"

  def set_locale
    I18n.locale = :ru
  end

  rescue_from Mongoid::Errors::DocumentNotFound, :with => :document_not_found

  def document_not_found
    render :status => 404, :template => "errors/admin404"
  end
end