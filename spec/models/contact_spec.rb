require 'spec_helper'

describe Contact do

  it "should ask for a checkbox selected" do
    @contact = Contact.new
    expect { @contact.save! }.to raise_error(ActiveRecord::RecordInvalid, /Please check at least one check box/)
  end

  it "shouldn't ask for a checkbox selected" do
    @contact = Contact.new(:no_magazine => true)
    expect { @contact.save! }.to_not raise_error(ActiveRecord::RecordInvalid, /Please check at least one check box/)
  end

  it "should ask for a valid first name" do
    @contact = Contact.new(:first_name => nil)
    expect { @contact.save! }.to raise_error(ActiveRecord::RecordInvalid, /First name/)
  end

  it "should ask for a valid first name" do
    @contact = Contact.new(:first_name => 'Rodrigo')
    expect { @contact.save! }.to_not raise_error(ActiveRecord::RecordInvalid, /First name/)
  end

  it "should ask for a valid last name" do
    @contact = Contact.new(:last_name => nil)
    expect { @contact.save! }.to raise_error(ActiveRecord::RecordInvalid, /Last name/)
  end

  it "should ask for a valid last name" do
    @contact = Contact.new(:last_name => 'Dominguez')
    expect { @contact.save! }.to_not raise_error(ActiveRecord::RecordInvalid, /Last name/)
  end

  it "should ask for an email when email_magazine is requested" do
    @contact = Contact.new(:email_magazine => true)
    expect { @contact.save! }.to raise_error(ActiveRecord::RecordInvalid, /email address/)
  end

  it "should ask for a valid mail when snail mail magazine is selected" do
    @contact = Contact.new(:snail_mail_magazine => true)
    expect { @contact.save! }.to raise_error(ActiveRecord::RecordInvalid, /email address/)    
  end


end
