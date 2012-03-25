# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
# Mime::Type.register_alias "text/html", :iphone

%w(localhost i4pcbr).each do |html_mimetype|
  Mime::Type.register_alias "text/html", html_mimetype.to_sym
end

#Mime::Type.register_alias "text/html", :localhost
#Mime::Type.register_alias "text/html", "4pcbr"