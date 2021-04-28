class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find params[:id]
    @latitude = @shop.latitude
    @longitude = @shop.longitude
  end

  def new
    @shop = Shop.new
  end

  def create
    shop = Shop.create shop_params
    redirect_to shop
  end

  def edit
    @shop = Shop.find params[:id]
  end

  def update
    shop = Shop.find params[:id]
    shop.update shop_params
    redirect_to shop
  end

  def destroy
    shop = Shop.find params[:id]
    shop.destroy
    redirect_to shops_path
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :logo, :tagline, :description, :founders, :established, :website, :image, :address, :category_ids => [], :brand_ids => [])
  end

end
