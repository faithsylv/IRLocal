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
s5 = Shop.create :name => 'Odgers & McClelland Exchange Stores', :address => '81 Jenkins St
Nundle NSW 2340', :tagline => 'Must-have kitchen & garden wares at Odgers & McClelland Exchange Stores, established 1891. Growing food on eight acres', :website => 'https://www.exchangestores.com.au/'

puts "#{Shop.count} shops created"

Category.destroy_all

c1 = Category.create :name => 'Kitchenware'
c2 = Category.create :name => 'Clothing'
c3 = Category.create :name => 'Outdoor and Sports'
c4 = Category.create :name => 'Homewares'

puts "#{Category.count} categories created"

Brand.destroy_all

b1 = Brand.create :name => 'Falcon Enamelware'
b2 = Brand.create :name => 'Chanel'
b3 = Brand.create :name => 'Jimmy Choo'
b4 = Brand.create :name => 'Olieve & Olie'
b5 = Brand.create :name => 'Only Orb'
b6 = Brand.create :name => "Saarde'"
b7 = Brand.create :name => "Nike"
b8 = Brand.create :name => "Coros"
b9 = Brand.create :name => "Asahi So"
b10 = Brand.create :name => "Carleen Devine"
b11 = Brand.create :name => "Dariya Gratte"
b12 = Brand.create :name => "Denise McDonald"
b13 = Brand.create :name => "Elisa Bartels"
b14 = Brand.create :name => "Greybox Design"

puts "#{Brand.count} brands created"


#Associations#########################################################################

c1.shops << s5
c2.shops << s1
c3.shops << s3
c4.shops << s2 << s4 <<s5

s1.brands << b2 << b3
s2.brands << b4 << b5 << b6
s3.brands << b7 << b8
s4.brands << b9 << b10 << b11 << b12 << b13 << b14
s5.brands << b1
