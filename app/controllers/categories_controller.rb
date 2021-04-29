class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find params[:id]
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.create category_params

    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      category.image = req["public_id"]
      category.save
    end

    redirect_to category
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    category = Category.find params[:id]

    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      category.image = req["public_id"]
    end

    category.update_attributes (category_params)
    category.save
    redirect_to category
  end

  def  destroy
    category = Category.find params[:id]
    category.destroy
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end
