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
    # Nothing at all, is a static page with no code
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created example as @contact" do
        Contact.stub(:new).with({'first_name' => 'marcos'}) { mock_contact(:save => true) }
        post :create, :contact => {'first_name' => 'marcos'}
        assigns(:contact).should be(mock_contact)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved contact as @contact" do
        Contact.stub(:new).with({'first_name' => nil}) { mock_contact(:save => false) }
        post :create, :contact => {'first_name' => nil}
        assigns(:contact).should be(mock_contact)
      end
    end

  end


end
