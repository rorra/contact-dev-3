require 'spec_helper'

describe "contacts/new.html.erb" do
  before(:each) do
    assign(:contact, stub_model(Contact,
      :new_record? => true,
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :address1 => "MyString",
      :address2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :country => "MyString",
      :apo_fpo => "MyString",
      :update_contact_info => "",
      :add_to_general => "",
      :remove_from_general => "",
      :email_magazine => "",
      :send_mail_magazine => "",
      :no_magazine => "",
      :comments => "MyText"
    ))
  end

  it "renders new contact form" do
    render

    rendered.should have_selector("form", :action => create_contact_path, :method => "post") do |form|
      form.should have_selector("input#contact_first_name", :name => "contact[first_name]")
      form.should have_selector("input#contact_last_name", :name => "contact[last_name]")
      form.should have_selector("input#contact_email", :name => "contact[email]")
      form.should have_selector("input#contact_address1", :name => "contact[address1]")
      form.should have_selector("input#contact_address2", :name => "contact[address2]")
      form.should have_selector("input#contact_city", :name => "contact[city]")
      form.should have_selector("select#contact_state", :name => "contact[state]")
      #form.should have_selector("input#contact_country", :name => "contact[country]")
      #form.should have_selector("input#contact_apo_fpo", :name => "contact[apo_fpo]")
      form.should have_selector("input#contact_update_contact_info", :name => "contact[update_contact_info]")
      form.should have_selector("input#contact_snail_mail_magazine", :name => "contact[snail_mail_magazine]")
      form.should have_selector("input#contact_email_magazine", :name => "contact[email_magazine]")
      form.should have_selector("input#contact_no_magazine", :name => "contact[no_magazine]")
      form.should have_selector("textarea#contact_comments", :name => "contact[comments]")
    end
  end
end
