class User < ApplicationRecord
  # Default Devise validation
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
  EMAIL_REGX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  # Double validation 
  validates_format_of :email, :with => EMAIL_REGX
  validates_uniqueness_of :email, :case_sensitive => false, :message => "Email already taken!"
  # Associations 
  has_many :courses
  has_many :course_enrollements
  belongs_to :university, optional: true
end
