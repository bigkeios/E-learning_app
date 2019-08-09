class LessonsController < ApplicationController
  include SessionsHelper
  before_action :logged_in_user, only: %i[new create show edit update destroy]
  before_action :admin_user, only: %i[new create edit update destroy]
  before_action :set_course, only: %i[new create destroy]
  before_action :set_lesson, only: %i[show edit update destroy]

  # GET courses/1/lessons/new
  def new
    @lesson = Lesson.new
  end

  # POST courses/1/lessons
  def create
    @lesson = @course.lessons.build(lesson_params)
    if @lesson.save
      flash.now[:success] = t :create_lesson_succ
      redirect_to course_path(@course)
    else
      render :new
    end
  end

  # GET lessons/1
  def show; end

  # GET lessons/1/edit
  def edit; end

  # POST lessons/1
  def update
    if @lesson.update_attributes(lesson_params)
      flash[:success] = t :updated_info
      redirect_to lesson_path(@lesson)
    else
      render :edit
    end
  end

  # DELETE lessons/1
  def destroy
    if @lesson.update_attributes(deleted: true)
      flash.now[:success] = t :delete_lesson_succ
    else
      flash[:danger] = t :delete_lesson_fail
    end
    redirect_to course_path(@course)
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

  def set_lesson
    lesson_id = params[:id]
    @lesson = Lesson.find_by(id: lesson_id)
    return if @lesson
    flash[:danger] = t :no_lesson
    redirect_to root_path
  end
end
