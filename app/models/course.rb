class Course < ApplicationRecord
    belongs_to :university
    belongs_to :user  , -> {where(teacher_role: true)}
    has_many :course_enrollements, dependent: :destroy
    extend FriendlyId 
    friendly_id :title, use: :slugged
    scope :search, lambda {|query| where(["title LIKE ? OR description LIKE ?", "%#{query}%",  "%#{query}%"])}  
end