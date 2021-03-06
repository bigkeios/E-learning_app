class WordsController < ApplicationController
  include SessionsHelper
  before_action :logged_in_user, :admin_user,
                only: %i[index import edit update destroy]
  before_action :set_word, only: %i[edit update destroy]
  # GET /words
  def index
    @categs = Category.all
    @words = Word.paginate(page: params[:page], per_page: 20)
  end

  # POST /words/import
  def import
    category = Category.find_by(id: params[:word][:category_id])
    uploaded_file = params[:file]
    if uploaded_file.content_type != "text/csv"
      flash[:danger] = t :incorrect_words_file
    else
      import_word_result = category.import_words(params[:file])
      if import_word_result.nil?
        flash[:success] = t :word_import_succ
      else
        flash[:danger] = "#{t :word_import_fail}. #{t :word_import_fail_check}:\
        #{import_word_result}"
      end
    end
    redirect_to words_path
  end

  # GET /words/1/edit
  def edit; end

  # POST /words/1
  def update
    if @word.update_attributes(word_params)
      flash[:success] = t :updated_info
      redirect_to words_path
    else
      render :edit
    end
  end

  # DELETE /words/1
  def destroy
    if @word.update_attributes(deleted: true)
      flash.now[:success] = t :delete_word_succ
    else
      flash.now[:danger] = t :delete_word_fail
    end
    redirect_to words_path
  end

  private

  def set_word
    @word = Word.find_by(id: params[:id])
  end

  def word_params
    params.require(:word).permit(:word, :definition)
  end
end
