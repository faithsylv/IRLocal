class SearchController < ApplicationController

  def index
    if params[:query].present?
      name = params[:query]
      if Brand.where("name ilike ?", "%#{name}%").present?
        @header = "Stores selling this brand:"
        brand = Brand.where("name ilike ?", "%#{name}%") #get array of possible brands
        @shops = brand.first.shops #take brand outside of array and get shops
      elsif Category.where("name ilike ?", "%#{name}%").present?
        @header = "Stores selling this category of goods:"
        category = Category.where("name ilike ?", "%#{name}%")
        @shops = category.first.shops
      elsif Shop.where("name ilike ?", "%#{name}%").present?
        @header = "Stores:"
        @shops = Shop.where("name ilike ?", "%#{name}%")
      else
        @return_text = "Sorry, we couldn't find your a store that sells that category or brand."
        @shops = Shop.all
      end
    end
  end
end
