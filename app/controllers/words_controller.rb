class WordsController < ApplicationController
  include SessionsHelper
  before_action :logged_in_user, :admin_user, only: %i[index import edit update destroy]
  before_action :set_word, only: %i[edit update]
  # GET /words
  def index
    @categs = Category.all
    @words = Word.paginate(page: params[:page], per_page: 20)
  end

  # POST /words/import
  def import
    category = Category.find_by(id: params[:word][:category_id])
    if category.import_words(params[:file])
      flash[:success] = t :word_import_succ
    else
      flash[:danger] = t :word_import_fail
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

  private

  def set_word
    @word = Word.find_by(id: params[:id])
  end

  def word_params
    params.require(:word).permit(:word, :definition)
  end
end
