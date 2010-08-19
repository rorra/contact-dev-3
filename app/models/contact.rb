class Contact < ActiveRecord::Base
  validate :one_or_more_checkboxes_present
  validate :no_checkbox_conflicts
  validate :email_or_address_present
  validate :all_or_none_address_fields

  validates_presence_of :first_name, :message => 'is required.'
  validates_format_of :first_name, :with => /\A[a-z \.\-]+\Z/i, :on => :create, :allow_nil => true, :allow_blank => true, :message => 'may contain letters, periods, hyphens, and spaces.'

  validates_presence_of :last_name, :message => 'is required.'
  validates_format_of :last_name, :with => /\A[a-z ,\'\.\-]+\Z/i, :on => :create, :allow_nil => true, :allow_blank => true, :message => 'may contain letters, commas, periods, hyphens, apostrophes, and spaces.'

  validates_presence_of :email, :if => :email_magazine, :message => "is required when 'Email me the Fisher House Magazine' is checked."
  validates_format_of :email, :with => /\A[a-z0-9\._-]+@[a-z0-9_-]+\.[a-z0-9\._-]+\Z/i, :on => :create, :allow_nil => true, :allow_blank => true, :message => 'may contain letters, numbers, periods, underscores, and hyphens.'

  validates_presence_of :address1, :if => :snail_mail_magazine, :message => "is required when 'Mail me the Fisher House Magazine' is checked."
  validates_format_of :address1, :with => /\A[a-z0-9 ,\.#]*\Z/i, :on => :create, :allow_nil => true, :allow_blank => true, :message => 'may contain letters, commas, periods, hyphens, number signs (#), and spaces.'

  validates_format_of :address2, :with => /\A[a-z0-9 ,\.#]*\Z/i, :on => :create, :allow_nil => true, :allow_blank => true, :message => 'may contain letters, commas, periods, hyphens, number signs (#), or spaces.'

  validates_format_of :city, :with => /\A[a-z \.-]+\Z/i, :on => :create, :allow_nil => true, :allow_blank => true, :message => 'may contain letters, hyphens, and spaces.'

  validates_format_of :zip, :with => /\A[0-9]{5}(\-[0-9]{4})?\Z/i, :on => :create, :allow_nil => true, :allow_blank => true, :message => 'may be a 5 digit (e.g. 12345) or 5 digit + 4 digit extension (e.g. 12435-6789).'

  apply_simple_captcha :message => '- please enter the number from the image below.'

  #for use in contact form pulldown
  STATES = ["AA", "AE", "AP", "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FL", "GA",
            "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS",
            "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA",
            "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"
  ]

  attr_accessible :first_name, :last_name, :email, :address1, :address2, :city, :state, :zip, :country, :apo_fpo, :update_contact_info,
                  :add_to_general, :remove_from_general, :email_magazine, :snail_mail_magazine, :no_magazine, :comments


  #custom validation
  def one_or_more_checkboxes_present
    errors.add(:base, 'Please check at least one check box.') unless update_contact_info || snail_mail_magazine ||
            email_magazine || no_magazine
  end

  #custom validation
  def no_checkbox_conflicts
    if (email_magazine || snail_mail_magazine) && no_magazine
      errors.add(:base, 'You have asked both to receive and not to receive our magazine.')
    end
  end

  #custom validation
  def email_or_address_present
    if email.blank? && address1.blank?
      errors.add(:base, 'Please provide us with an email address, a postal address, or both.')
    end
  end

  #custom validation
  def all_or_none_address_fields
    if ((address1.blank? && address2.blank?) || city.blank? || state.blank? || zip.blank?) &&
            !(address1.blank? && address2.blank? && city.blank? && state.blank? && zip.blank?)
      errors.add(:base, 'Your postal address is incomplete.')
    end
  end
end
