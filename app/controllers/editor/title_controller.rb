class Editor::TitleController < ApplicationController
  before_filter :authenticate_jedi!, :set_locale
  layout "admin"

  def set_locale
    I18n.locale = :ru
  end
end
