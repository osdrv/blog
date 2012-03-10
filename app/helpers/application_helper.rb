module ApplicationHelper
  def text_cut(text)
    text.split(/<cut\s*\/>/).first if !text.blank?
  end

  def nl2br( str )
    str.gsub( /\n/, "<br/>" ) rescue ""
  end
end
