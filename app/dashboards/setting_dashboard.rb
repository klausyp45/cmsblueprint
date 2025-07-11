require "administrate/base_dashboard"

class SettingDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    app_name: Field::String,
    application_developer: Field::String,
    application_status: Field::String,
    application_status_message: Field::Text,
    application_version: Field::String,
    cell_number: Field::String,
    company_name: Field::String,
    email_address: Field::String,
    address: Field::Text,
    facebook_url: Field::String,
    linkedin_url: Field::String,
    office_number: Field::String,
    twitter_url: Field::String,
    whats_app_number: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    app_name
    application_developer
    application_status
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    app_name
    application_developer
    application_status
    application_status_message
    application_version
    cell_number
    company_name
    email_address
    address
    facebook_url
    linkedin_url
    office_number
    twitter_url
    whats_app_number
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    app_name
    company_name
    email_address
    office_number
    address
    cell_number
    whats_app_number
    facebook_url
    twitter_url
    linkedin_url
    application_status
    application_status_message
    application_version
    application_developer
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how settings are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(setting)
  #   "Setting ##{setting.id}"
  # end
end
