# -*- encoding : utf-8 -*-
require File.dirname(__FILE__) + '/spec_helper'

OBJS = ["bla", 'бла', ['bla', 'бла'], nil]
H = {:bla => 'bla', 'бла' => 1, :url => nil, :x => [:a => "идф", :b => true]}

describe "encoding-kawai" do

  if RUBY_VERSION < '1.9'
  
    %w{utf8 binary}.each do |enc|
      OBJS.each do |obj|
        it "should word for each object to code with #{enc} on obj: #{obj.inspect}" do
          obj.send("#{enc}!").should == obj
        end
      end
      
      it "should word for each object to code with #{enc} on obj: #{H.inspect}" do
        H.send("#{enc}!").should == H
      end                                
    end
    
  else
  
    %w{utf8 binary}.each do |enc|
      OBJS.each do |obj|
        it "should word for each object to code with #{enc} on obj: #{obj.inspect}" do
          obj.send("#{enc}!").should == obj
        end                                          
      end
      
      it "should word for each object to code with #{enc} on obj: #{H.inspect}" do
        str = enc == 'utf8' ? "бла".force_encoding('utf-8') : "бла".force_encoding('binary')
        H.send("#{enc}!").should == {:bla => 'bla', str => 1}
      end              
      
      it "should set encoding" do
        str = "бла"
        str.encoding.name.should == "UTF-8"
        str.send("#{enc}!")
        if enc == 'utf8'
          str.encoding.name.should == 'UTF-8'
        else
          str.encoding.name.should == 'ASCII-8BIT'
        end
      end
    end
  end
end
