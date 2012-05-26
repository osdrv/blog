require "html_with_pygments"

module ApplicationHelper
  def text_cut( text )
    text.split( /<cut\s*\/?>/ ).first if !text.blank?
  end

  def has_text_cut?( text )
  	!text.match( /<cut\s*\/?>/ ).nil?
  end

  def nl2br( str )
    str.gsub( /\n/, "<br/>" ) rescue ""
  end
  
  def markdown( text )
    markdown_renderer.render( text ).html_safe
  end

  def markdown_renderer
    @markdown_renderer ||= Redcarpet::Markdown.new( HTMLwithPygments, :fenced_code_blocks => true, :hard_wrap => true, :autolink => true )
  end

  def with_request_format( content_type )
    current_format = request.format
    request.format = content_type.to_sym
    yield if block_given?
    request.format = current_format
  end

end
