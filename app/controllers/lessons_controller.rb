class LessonsController < ApplicationController
  include SessionsHelper
  before_action :logged_in_user, only: %i[new create]
  before_action :admin_user, only: %i[new create]
  before_action :set_course, only: %i[new create]

  # GET courses/1/lessons/new
  def new
    @lesson = Lesson.new
  end

  # POST courses/1/lessons
  def create
    @lesson = @course.lessons.build(lesson_params)
    if @lesson.save
      flash.now[:success] = t :create_lesson_succ
      redirect_to course_path()
    else
      render :new
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(:name, :objective)
  end

  def set_course
    @course = Course.find_by(id: params[:course_id])
    return if @course
    flash[:danger] = t :no_course
    redirect_to root_path
  end
end
