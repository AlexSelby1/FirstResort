# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.delete_all
Category.create(:id => 1, :title=>'Bar', :image=>'barCat.jpeg')
Category.create(:id => 2, :title=>'Floor', :image=>'waitCat.jpeg')
Category.create(:id => 3, :title=>'Kitchen', :image=>'chefCat.jpeg')
Category.create(:id => 4, :title=>'Cafe', :image=>'cafeCat.jpeg')
puts "Success: Category data loaded"

User.delete_all
User.create(:id => 1, :name=>'McCarthys Bar and Grill', :password=>'password', :email=>'host@test.com', :isHost=>'true', :isAdmin=>'false', isCandidate:'false',:country=>'IE')
User.create(:id => 2, :name=>'Fattys Bar', :password=>'password', :email=>'host2@test.com', :isHost=>'true', :isAdmin=>'false', isCandidate:'false',:country=>'BE')
User.create(:id => 3, :name=>'Smokys Cafe', :password=>'password', :email=>'host3@test.com', :isHost=>'true', :isAdmin=>'false', isCandidate:'false',:country=>'ES')
User.create(:id => 4, :name=>'Jean Elise', :password=>'password', :email=>'candidate@test.com', :isHost=>'false', :isAdmin=>'false', isCandidate:'true',:country=>'FR')
User.create(:id => 5, :name=>'Tom O Hara', :password=>'password', :email=>'candidate2@test.com', :isHost=>'false', :isAdmin=>'false', isCandidate:'true',:country=>'SC')
User.create(:id => 6, :name=>'John Morahan', :password=>'password', :email=>'candidate3@test.com', :isHost=>'false', :isAdmin=>'false', isCandidate:'true',:country=>'IE')
User.create(:id => 7, :name=>'Alex Admin', :password=>'password', :email=>'admin@test.com', :isHost=>'false', :isAdmin=>'true', isCandidate:'false',:country=>'IE')
puts "Success: User data loaded"

#Job.delete_all
#Job.create(:id => 1, :title=>'Barman required for summer period', :country=>'Ireland', :category=>'Bar', :user_id=>'1')
#Job.create(:id => 2, :title=>'Looking for a Chef - 5 years experience', :country=>'Ireland', :category=>'Kitchen', :user_id=>'1')
#Job.create(:id => 3, :title=>'URGENT - Bar Manager role available', :country=>'Ireland', :category=>'Bar', :user_id=>'1')
