class University < ApplicationRecord
    has_many :courses, dependent: :destroy
    has_many :users
    extend FriendlyId
    friendly_id :name, use: :slugged
end
