require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    admin: Field::Boolean,
    billing_address: Field::Text,
    city_of_residence: Field::String,
    comments: Field::HasMany,
    country_of_residence: Field::String,
    date_of_birth: Field::Date,
    email: Field::String,
    encrypted_password: Field::String,
    first_name: Field::String,
    gender: Field::String,
    last_name: Field::String,
    likes: Field::HasMany,
    phone_number: Field::String,
    postal_code: Field::String,
    posts: Field::HasMany,
    profile_picture: Field::String,
    province: Field::String,
    remember_created_at: Field::DateTime,
    reset_password_sent_at: Field::DateTime,
    reset_password_token: Field::String,
    street_and_number: Field::String,
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
    first_name
    last_name
    admin
    comments
    posts
    likes
    email
    phone_number
    created_at
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    admin
    billing_address
    city_of_residence
    comments
    country_of_residence
    date_of_birth
    email
    encrypted_password
    first_name
    gender
    last_name
    likes
    phone_number
    postal_code
    posts
    profile_picture
    province
    remember_created_at
    reset_password_sent_at
    reset_password_token
    street_and_number
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    admin
    billing_address
    city_of_residence
    comments
    country_of_residence
    date_of_birth
    email
    encrypted_password
    first_name
    gender
    last_name
    likes
    phone_number
    postal_code
    posts
    profile_picture
    province
    remember_created_at
    reset_password_sent_at
    reset_password_token
    street_and_number
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

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
