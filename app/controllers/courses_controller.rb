class CoursesController < ApplicationController
  include SessionsHelper
  before_action :logged_in_user, only: %i[index show new create edit update]
  before_action :set_course, only: %i[show edit update]
  before_action :admin_user, only: %i[new create edit update]

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

  # GET courses/1/edit
  def edit; end

  # POST courses/1
  def update
    if @course.update_attributes(course_params)
      flash[:success] = t :updated_info
      redirect_to course_path(@course)
    else
      render :edit
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :desc)
  end

  def set_course
    @course = Course.find_by(id: params[:id])
  end
end
