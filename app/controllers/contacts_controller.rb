class ContactsController < ApplicationController
  before_filter :set_page_title

  ssl_required :new, :create
  ssl_allowed :thank_you

  caches_page :new, :thank_you

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])

    #if verify_recaptcha(:model => @contact, :message => 'The verification phrase at the end was misspelled') && @contact.save
    if @contact.save_with_captcha
      redirect_to :action => 'thank_you'
    else
      render :action => 'new'
    end
  end

  def thank_you
    
  end

  private

  def set_page_title
    @page_title = "Contact Us"
  end

end
