class Course < ApplicationRecord
    belongs_to :university
    belongs_to :user
    extend FriendlyId
    friendly_id :title, use: :slugged
    scope :search, lambda {|query| where(["title LIKE ? OR description LIKE ?", "%#{query}%",  "%#{query}%"])}
end
