class PagesController < ApplicationController
  def home
    @shop1 = Shop.find_by name: 'Duke & D HOME'
    @shop2 = Shop.find_by name: 'The Frock Exchange'
    @shop3 = Shop.find_by name: 'Chinaclay'
  end

  def search
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
        @return_text = "Sorry, we couldn't find a store that sells that category or brand."
        @shops = Shop.all
      end
    end

    gon.shops = @shops

  end

end
