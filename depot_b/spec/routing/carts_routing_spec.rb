require "spec_helper"

describe CartsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/carts" }.should route_to(:controller => "carts", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/carts/new" }.should route_to(:controller => "carts", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/carts/1" }.should route_to(:controller => "carts", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/carts/1/edit" }.should route_to(:controller => "carts", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/carts" }.should route_to(:controller => "carts", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/carts/1" }.should route_to(:controller => "carts", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/carts/1" }.should route_to(:controller => "carts", :action => "destroy", :id => "1")
    end

  end
end
