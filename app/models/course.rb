class Course < ApplicationRecord
    belongs_to :university
    belongs_to :user  , -> {where(teacher_role: true)}
    has_many :course_enrollements
    extend FriendlyId 
    friendly_id :title, use: :slugged
    scope :search, lambda {|query| where(["title LIKE ? OR description LIKE ?", "%#{query}%",  "%#{query}%"])}
    scope :enrolled_to?, lambda {|user| self.course_enrollements.include?(user.course_enrollements)}
end
