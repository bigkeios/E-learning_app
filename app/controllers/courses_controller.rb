class CoursesController < ApplicationController
  # GET /users
  def index; end

  # GET /users/new
  def new
    @course = Course.new
  end

  # POST /users
  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path
    else
      render :new
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :desc)
  end
end
