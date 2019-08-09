class WordsController < ApplicationController
  # GET /words
  def index
    @categs = Category.all
    @words = Word.paginate(page: params[:page], per_page: 20)
  end

  def import
    category = Category.find_by(id: params[:word][:category_id])
    if category.import_words(params[:file])
      flash[:success] = t :word_import_succ
    else
      flash[:danger] = t :word_import_fail
    end
    redirect_to words_path
  end
end
