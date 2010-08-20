require "spec_helper"

describe ContactsController do
  describe "routing" do

    it "recognizes /magazine/request" do
      {:get => "/magazine/request"}.should route_to(:controller => "contacts", :action => "new")
    end

    it "recognizes /magazine/thank_you" do
      {:get => "/magazine/thank_you"}.should route_to(:controller => "contacts", :action => "thank_you")
    end

    it "recognizes /magazine/create" do
      {:post => "/magazine/create"}.should route_to(:controller => "contacts", :action => "create")
    end
  end
end
