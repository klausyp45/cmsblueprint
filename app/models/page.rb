class Page < ApplicationRecord
    has_one_attached :feature_image
    has_one_attached :main_image
end
