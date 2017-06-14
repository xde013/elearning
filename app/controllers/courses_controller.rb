class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /courses
  def all 
    @courses = Course.all
    if params[:search]
      @courses = Course.search(params[:search]).order("Created_at DESC") # using search named scope
    end
  end
  
  def index
    @courses = [] # initialization to push enroll's course
    if current_user.student_role? # Double validation 
       current_user.course_enrollements.all.each do |entry|
          @courses << entry.course
        end
     else 
       @courses = current_user.courses
    end 
  end

  # GET /courses/1
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
   
  end

  # POST /courses
  def create
    @course = current_user.courses.new(course_params)
    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /courses/1
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_course
      @course = Course.friendly.find(params[:id])
    end
    
    # Never trust parameters from the scary internetz
    def course_params
      params.require(:course).permit(:title, :description, :length, :subjectstring, :level, :image_url, :slug, :university_id)
    end
end
