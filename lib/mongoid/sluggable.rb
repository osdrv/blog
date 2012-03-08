#encoding: utf-8

module Mongoid
  module Sluggable

    extend ActiveSupport::Concern
    extend self

    module ClassMethods
      def sluggable(slug_name, slug = nil, &blk)
        field slug_name
        validates_uniqueness_of slug_name
        blk = lambda { |e| e.send(slug) } if !slug.nil?
        cattr_accessor :__slug_getter
        before_validation :update_slug
        self.__slug_getter = blk
      end


      def slugged(slug)
        return nil if slug.nil?
        first(:conditions => { :slug => slug })
      end
    end


    included do
      def update_slug
        ( self.slug = Mongoid::Sluggable.filter_slug( self.class.__slug_getter.call( self ) ).downcase ) if slug.blank?
      end
    end

    def filter_slug( slug )
      slug.gsub(/[\s\.\-]/, '_').gsub(/[\+\,\;\:\!\@\#\%\&\(\)\'\"\?]/, "") if !slug.blank?
    end
  end
end
