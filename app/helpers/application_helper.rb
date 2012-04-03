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
    #options = [, :filter_html, , :no_intraemphasis, :fenced_code, :gh_blockcode]
    markdown_renderer.render( text ).html_safe
    # syntax_highlighter(Redcarpet.new(text, *options).to_html).html_safe
  end

  def markdown_renderer
    @markdown_renderer ||= Redcarpet::Markdown.new( HTMLwithPygments, :fenced_code_blocks => true, :hard_wrap => true, :autolink => true )
  end

  # def syntax_highlighter(html)
  #   doc = Nokogiri::HTML(html)
  #   doc.search("//pre[@lang]").each do |pre|
  #     pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
  #   end
  #   doc.to_s
  # end
end
