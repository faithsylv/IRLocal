class BrandsController < ApplicationController

  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.find params[:id]
  end

  def new
    @brand = Brand.new
  end

  def create
    brand = Brand.create brand_params
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      brand.logo = req["public_id"]
      brand.save
    end
    if params[:brand][:images].present?
      params[:brand][:images].each do |image|
        req = Cloudinary::Uploader.upload image
        brand.images << req["public_id"]
      end
    end
    brand.save
    redirect_to brand
  end

  def edit
    @brand = Brand.find params[:id]
  end

  def update
    brand = Brand.find params[:id]
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      brand.logo = req["public_id"]
    end

    if params[:brand][:images].present?
      brand.images=[]
      params[:brand][:images].each do |image|
        req = Cloudinary::Uploader.upload image
        brand.images << req["public_id"]
      end
    end

    brand.update_attributes brand_params
    brand.save
    redirect_to brand
  end

  def destroy
    brand = Brand.find params[:id]
    brand.destroy
    redirect_to brands_path
  end

  private
  def brand_params
    params.require(:brand).permit(:name, :description, :established)
  end

end
