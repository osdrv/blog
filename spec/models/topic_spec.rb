#encoding: utf-8

require 'spec_helper'

describe Topic do
  context "save" do
    let( :title ) { Factory.next( :string ) }
    let( :text ) { Factory.next( :string ) }
    let( :tags ) { [].tap{ |a| 5.times { a.push Factory.next( :string ) } } }
    let!( :t_blog ) { Factory( :t_blog ) }

    it "сохранит если все необходимые данные присутствуют" do
      topic = Topic.new( :title => title, :text => text, :tags => tags, :t_blog => t_blog )
      topic.save.should be_true
    end

    it "не сохранит без привязки к блогу" do
      topic = Topic.new( :title => title, :text => text, :tags => tags )
      topic.save.should be_false
    end

    it "сохранит c привязкой к ID блога" do
      topic = Topic.new( :title => title, :text => text, :tags => tags, :t_blog_id => t_blog.id.to_s )
      topic.save.should be_true
    end
  end

  context "tags" do
    let( :tags ) { [].tap{ |a| 5.times { a.push Factory.next( :string ) } }.join(", ") }
    let!( :t_blog ) { Factory( :t_blog ) }
    let!( :topic ) { Factory( :topic, :t_blog => t_blog ) }
    it "сохранит список тегов если они заданы строкой" do
      topic.tags = tags
      topic.tags.is_a?( Array ).should be_true
      topic.tags.should eq tags.split(/\,\s*/)
    end
  end
end
