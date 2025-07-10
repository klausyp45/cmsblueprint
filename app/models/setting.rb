class Setting < ApplicationRecord
  validates :app_name, presence: true
  
  # Singleton pattern implementation
  def self.instance
    first_or_create!(
      app_name: 'My Application',
      company_name: 'My Company',
      application_status: 'Live',
      application_version: '1.0.0'
    )
  end
  
  # Helper methods for status checks
  def live?
    application_status == 'Live'
  end
  
  def maintenance?
    application_status == 'Maintenance'
  end
  
  def offline?
    application_status == 'Offline'
  end
end
