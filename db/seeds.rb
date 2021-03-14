# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.delete_all
Category.create(:id => 1, :title=>'Bar', :image=>'barCat.jpeg')
Category.create(:id => 2, :title=>'Floor', :image=>'wait.jpeg')
Category.create(:id => 3, :title=>'Kitchen', :image=>'chef.jpeg')
Category.create(:id => 4, :title=>'Cafe', :image=>'Cafe.jpeg')
puts "Success: Category data loaded"