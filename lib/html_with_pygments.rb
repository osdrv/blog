class HTMLwithPygments < Redcarpet::Render::HTML
  def block_code( code, language )
    Pygments.highlight( code, :lexer => language.to_sym, :options => { :encoding => 'utf-8' } )
  end
end