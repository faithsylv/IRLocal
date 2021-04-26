# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Shop.destroy_all

s1 = Shop.create :name => 'The Frock Exchange', :address => '221 Clovelly Rd, Clovelly NSW 2031', :tagline => 'Shop pre-Loved Designer Luxury Consignment.', :website => 'http://www.thefrockexchange.com.au/'
s2 = Shop.create :name => 'Duke & D HOME', :address => '228B Clovelly Road Shop 6 Clovelly, Coogee NSW 2031', :tagline => 'Clovelly interiors store specialising in Australian & globally sourced chic homewares, furnishings & gifts for her • him • you', :website => 'https://www.dukeanddhome.com.au/'
s3 = Shop.create :name => 'Runners Shop', :address => '201 Clovelly Rd, Randwick NSW 2031', :tagline => '
Running & sports shoes, accessories & nutrition.', :website => 'https://runnersshop.com.au/'
s4 = Shop.create :name => 'Chinaclay', :address => '27 Burnie St, Clovelly NSW 2031', :tagline => 'The home of handmade Australian ceramics & bespoke flowers', :website => 'https://chinaclay.com.au/'

puts "#{Shop.count} shops created"

Category.destroy_all

c1 = Category.create :name => 'Kitchenware'
c2 = Category.create :name => 'Clothing'
c3 = Category.create :name => 'Outdoor and Sports'
c4 = Category.create :name => 'Homewares'

puts "#{Category.count} categories created"

#Associations#########################################################################

s1 << c2
s2 << c4
s3 << c3
s4 << c4
