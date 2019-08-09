class CategoriesController < ApplicationController
  def import
    if Category.import(params[:file])
        flash[:success] = t :categ_imported_succ
    else
      flash[:danger] = t :categ_imported_fail
    end
  end
end
