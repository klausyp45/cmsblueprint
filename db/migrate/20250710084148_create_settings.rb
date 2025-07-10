class CreateSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :settings do |t|
      t.string :app_name
      t.string :company_name
      t.string :email_address
      t.string :office_number
      t.string :cell_number
      t.string :whats_app_number
      t.string :facebook_url
      t.string :twitter_url
      t.string :linkedin_url
      t.string :application_status
      t.text :application_status_message
      t.string :application_version
      t.string :application_developer

      t.timestamps
    end
  end
end
