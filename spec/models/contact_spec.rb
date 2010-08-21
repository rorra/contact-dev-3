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

  it "shouldn't ask for a valid first name" do
    @contact = Contact.new(:first_name => 'Rodrigo')
    expect { @contact.save! }.to_not raise_error(ActiveRecord::RecordInvalid, /First name/)
  end

  it "should ask for a valid last name" do
    @contact = Contact.new(:last_name => nil)
    expect { @contact.save! }.to raise_error(ActiveRecord::RecordInvalid, /Last name/)
  end

  it "shouldn't ask for a valid last name" do
    @contact = Contact.new(:last_name => 'Dominguez')
    expect { @contact.save! }.to_not raise_error(ActiveRecord::RecordInvalid, /Last name/)
  end

  it "should ask for an email when email_magazine is requested" do
    @contact = Contact.new(:email_magazine => true)
    expect { @contact.save! }.to raise_error(ActiveRecord::RecordInvalid, /email address/)
  end

  it "shouldn't ask for an email when email_magainze is requested and a email is provided" do
    @contact = Contact.new(:email_magazine => true, :email => 'rorra@rorra.com.ar')
    expect { @contact.save! }.to_not raise_error(ActiveRecord::RecordInvalid, /email address/)
  end

  it "should ask for a valid address when snail mail magazine is selected" do
    @contact = Contact.new(:snail_mail_magazine => true)
    expect { @contact.save! }.to raise_error(ActiveRecord::RecordInvalid, /Address1/)    
  end

  it "shouldn't ask for a valid address when snail mail magazine is selected and a address is provided" do
    @contact = Contact.new(:snail_mail_magazine => true, :address1 => 'My Address')
    expect { @contact.save! }.to_not raise_error(ActiveRecord::RecordInvalid, /Address1/)
  end

  it "should complain about checkboxes conflict" do
    @contact = Contact.new(:email_magazine => true, :no_magazine => true)
    expect { @contact.save! }.to raise_error(ActiveRecord::RecordInvalid, /You have asked both to receive and not to receive our magazine/)
    @contact = Contact.new(:snail_mail_magazine => true, :no_magazine => true)
    expect { @contact.save! }.to raise_error(ActiveRecord::RecordInvalid, /You have asked both to receive and not to receive our magazine/)
    @contact = Contact.new(:email_magazine => true, :snail_mail_magazine => true, :no_magazine => true)
    expect { @contact.save! }.to raise_error(ActiveRecord::RecordInvalid, /You have asked both to receive and not to receive our magazine/)
  end

  it "should ask for a valid email or address" do
    @contact = Contact.new(:email => '', :address1 => '')
    expect { @contact.save! }.to raise_error(ActiveRecord::RecordInvalid, /Please provide us with an email address, a postal address, or both/ )
  end

  it "shouldn't ask for a valid email or address" do 
    @contact = Contact.new(:email => 'rorra@rorra.com.ar')
    expect { @contact.save! }.to_not raise_error(ActiveRecord::RecordInvalid, /Please provide us with an email address, a postal address, or both/ )
    @contact = Contact.new(:address1 => 'San Diego')
    expect { @contact.save! }.to_not raise_error(ActiveRecord::RecordInvalid, /Please provide us with an email address, a postal address, or both/ )
    @contact = Contact.new(:email => 'rorra@rorra.com.ar', :address1 => 'California')
    expect { @contact.save! }.to_not raise_error(ActiveRecord::RecordInvalid, /Please provide us with an email address, a postal address, or both/ )
  end

  it "should complain about address being uncompleted" do
    @contact = Contact.new(:address1 => 'Pinnacle Street')
    expect { @contact.save! }.to raise_error(ActiveRecord::RecordInvalid, /Your postal address is incomplete/)
    @contact = Contact.new(:address2 => 'Apartment 2')
    expect { @contact.save! }.to raise_error(ActiveRecord::RecordInvalid, /Your postal address is incomplete/)
    @contact = Contact.new(:city => 'San Diego')
    expect { @contact.save! }.to raise_error(ActiveRecord::RecordInvalid, /Your postal address is incomplete/)
    @contact = Contact.new(:state => 'California')
    expect { @contact.save! }.to raise_error(ActiveRecord::RecordInvalid, /Your postal address is incomplete/)
    @contact = Contact.new(:zip => '40345')
    expect { @contact.save! }.to raise_error(ActiveRecord::RecordInvalid, /Your postal address is incomplete/)
  end

  it "shouldn't complain about the address being uncompleted" do
    @contact = Contact.new(:address1 => "Pinacle Street",
                           :address2 => "Apartment 2",
                           :city => "San Diego",
                           :state => "California",
                           :zip => "40345")
    expect { @contact.save! }.to_not raise_error(ActiveRecord::RecordInvalid, /Your postal address in incomplete/)
  end

end
