require 'test_helper'

class CourseEnrollementControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get course_enrollement_create_url
    assert_response :success
  end

end
