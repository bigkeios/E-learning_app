class CoursesController < ApplicationController
  include SessionsHelper
  before_action :logged_in_user, only: %i[index new create show]
  before_action :set_course, only: %i[show]
  before_action :admin_user, only: %i[new create]

  # GET /courses
  def index
    @courses = Course.paginate(page: params[:page], per_page: 20)
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # POST /courses
  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path
    else
      render :new
    end
  end

  # GET courses/1
  def show; end

  private

  def course_params
    params.require(:course).permit(:name, :desc)
  end

  def set_course
    @course = Course.find_by(id: params[:id])
  end
end
