# Project1: IRLocal

IRLocal is a website that encourages support of locally owned businesses by allowing users to search for brands or categories of goods to find the small businesses in their area that sell those items.

<em> <small>Created by Faith Sylvia - General Assembly Class Project.</small></em>

## Demo
Click [here](https://irlocal.herokuapp.com/) to visit.

<em> <small>NB server may take up to 20 seconds to load the page.</small></em>

## Technology Used

This project was a culminating experience in back-end development with **Ruby on Rails**, and the bulk of the work is done within the Rails framework, including the front-end user-facing views (with some assistance from Bootstrap). Javascript utilised to integrate Google Maps API.

* Ruby on Rails
* JavaScript
* CSS / Bootstrap
* HTML
* Gems and APIs:
  *  Google Maps API
  *  Ruby geocoder gem
  *  gon gem
  *  js-routes gem
  *  cloudinary gem

## Key Features

1. Search through database by brand or category
1. Search takes user to page with map, centred on their current location.
1. Featured stores on home page which take link to the show page of that store.
1. Upload single and multiple images when adding a brand or shop.
1. View brands sold by each shop that link through to the show page for each respective brand. Likewise, can view shops selling each brand from that brand's show page and can view shops selling each category from that category's show page.

## Code Highlights

I realised the power of SQL and 'walking the graph' here. I found it interesting that you can effectively do a multi-search in a single search bar without using a gem. Here you can also see where I have used geocoder alongside the gon gem to integrate ruby with javascript for use with the Google Maps API.

```Ruby
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
      @header = "Sorry, we couldn't find a store that sells that category or brand."
      @shops = Shop.all
    end
  else
      @header = "All Stores:"
      @shops = Shop.all
  end

  gon.shops = @shops
  @IP = get_remote_ip()
  @userAddress = Geocoder.search(@IP)

  p gon.latitude = @userAddress.first.coordinates[0]
  p gon.longitude = @userAddress.first.coordinates[1]

end
```


## Future Developments

1. Add subcategories under each category of goods (i.e. baby clothes under the clothes category) and allow search by subcategory.
1. Add users to allow for admin functionality to approve new additions to database and prevent all users from editing and deleting a new entry after creation.
1. Add About page and Blog.
1. Thin out controllers (particularly search controller!)
