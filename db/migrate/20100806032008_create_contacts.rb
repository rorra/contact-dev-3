class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :apo_fpo 
      t.boolean :update_contact_info
      t.boolean :add_to_general
      t.boolean :remove_from_general
      t.boolean :email_magazine
      t.boolean :snail_mail_magazine
      t.boolean :snail_mail_magazine
      t.text :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
