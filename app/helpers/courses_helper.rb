module CoursesHelper
    def studied_by?(course, user)
        !course.course_enrollements.where(:user_id => user.id).empty?
    end
end
