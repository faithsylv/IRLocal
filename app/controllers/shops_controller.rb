class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find params[:id]
    gon.shop = @shop
  end

  def new
    @shop = Shop.new
  end

  def create
    shop = Shop.create shop_params
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      shop.logo = req["public_id"]
      shop.save
    end

    if params[:shop][:images].present?
      params[:shop][:images].each do |image|
        req = Cloudinary::Uploader.upload image
        shop.images << req["public_id"]
      end
    end
    shop.save

    redirect_to shop
  end

  def edit
    @shop = Shop.find params[:id]
  end

  def update
    shop = Shop.find params[:id]
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      shop.logo = req["public_id"]
    end

    if params[:shop][:images].present?
      shop.images=[]
      params[:shop][:images].each do |image|
        req = Cloudinary::Uploader.upload image
        shop.images << req["public_id"]
      end
    end

    shop.update_attributes (shop_params)
    shop.save
    redirect_to shop
  end

  def destroy
    shop = Shop.find params[:id]
    shop.destroy
    redirect_to shops_path
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :tagline, :description, :founders, :established, :website, :address, :category_ids => [], :brand_ids => [])
  end

end
