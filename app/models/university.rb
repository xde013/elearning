class University < ApplicationRecord
    has_many :courses, dependent: :destroy
    has_many :users, dependent: :destroy
    extend FriendlyId
    friendly_id :name, use: :slugged
end
