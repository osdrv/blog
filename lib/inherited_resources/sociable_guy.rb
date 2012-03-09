module InheritedResources
  module SociableGuy
    extend ActiveSupport::Concern
    included do
      %w(create update).each do |m|
        define_method(m) do
          self.send("#{m}!") { collection_url }
        end
      end
    end
  end
end