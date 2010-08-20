require 'spec_helper'

describe ContactsController do

  def mock_contact(stubs={})
    @mock_contact ||= mock_model(Contact, stubs).as_null_object
  end

  describe "GET new" do
    it "assigns a new contact as @contact" do
      Contact.stub(:new) { mock_contact }
      get :new
      assigns(:contact).should be(mock_contact)
    end
  end

  describe "GET thank_you" do

  end

#  describe "GET index" do
#    it "assigns all examples as @examples" do
#      Example.stub(:all) { [mock_example] }
#      get :index
#      assigns(:examples).should eq([mock_example])
#    end
#  end
#
#  describe "GET show" do
#    it "assigns the requested example as @example" do
#      Example.stub(:find).with("37") { mock_example }
#      get :show, :id => "37"
#      assigns(:example).should be(mock_example)
#    end
#  end
#
#  describe "GET new" do
#    it "assigns a new example as @example" do
#      Example.stub(:new) { mock_example }
#      get :new
#      assigns(:example).should be(mock_example)
#    end
#  end
#
#  describe "GET edit" do
#    it "assigns the requested example as @example" do
#      Example.stub(:find).with("37") { mock_example }
#      get :edit, :id => "37"
#      assigns(:example).should be(mock_example)
#    end
#  end
#
#  describe "POST create" do
#
#    describe "with valid params" do
#      it "assigns a newly created example as @example" do
#        Example.stub(:new).with({'these' => 'params'}) { mock_example(:save => true) }
#        post :create, :example => {'these' => 'params'}
#        assigns(:example).should be(mock_example)
#      end
#
#      it "redirects to the created example" do
#        Example.stub(:new) { mock_example(:save => true) }
#        post :create, :example => {}
#        response.should redirect_to(example_url(mock_example))
#      end
#    end
#
#    describe "with invalid params" do
#      it "assigns a newly created but unsaved example as @example" do
#        Example.stub(:new).with({'these' => 'params'}) { mock_example(:save => false) }
#        post :create, :example => {'these' => 'params'}
#        assigns(:example).should be(mock_example)
#      end
#
#      it "re-renders the 'new' template" do
#        Example.stub(:new) { mock_example(:save => false) }
#        post :create, :example => {}
#        response.should render_template("new")
#      end
#    end
#
#  end
#
#  describe "PUT update" do
#
#    describe "with valid params" do
#      it "updates the requested example" do
#        Example.should_receive(:find).with("37") { mock_example }
#        mock_example.should_receive(:update_attributes).with({'these' => 'params'})
#        put :update, :id => "37", :example => {'these' => 'params'}
#      end
#
#      it "assigns the requested example as @example" do
#        Example.stub(:find) { mock_example(:update_attributes => true) }
#        put :update, :id => "1"
#        assigns(:example).should be(mock_example)
#      end
#
#      it "redirects to the example" do
#        Example.stub(:find) { mock_example(:update_attributes => true) }
#        put :update, :id => "1"
#        response.should redirect_to(example_url(mock_example))
#      end
#    end
#
#    describe "with invalid params" do
#      it "assigns the example as @example" do
#        Example.stub(:find) { mock_example(:update_attributes => false) }
#        put :update, :id => "1"
#        assigns(:example).should be(mock_example)
#      end
#
#      it "re-renders the 'edit' template" do
#        Example.stub(:find) { mock_example(:update_attributes => false) }
#        put :update, :id => "1"
#        response.should render_template("edit")
#      end
#    end
#
#  end
#
#  describe "DELETE destroy" do
#    it "destroys the requested example" do
#      Example.should_receive(:find).with("37") { mock_example }
#      mock_example.should_receive(:destroy)
#      delete :destroy, :id => "37"
#    end
#
#    it "redirects to the examples list" do
#      Example.stub(:find) { mock_example }
#      delete :destroy, :id => "1"
#      response.should redirect_to(examples_url)
#    end
#  end

end
