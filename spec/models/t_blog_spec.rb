#encoding: utf-8

require 'spec_helper'

describe TBlog do
  
  context "create" do
    let( :title ) { Factory.next( :string ) }
    let( :domain ) { Factory.next( :domain ) }
    it "сохранит новый инстанс" do
      blog = TBlog.new( :title => title, :domain => domain )
      blog.save.should be_true
    end
  end

end
