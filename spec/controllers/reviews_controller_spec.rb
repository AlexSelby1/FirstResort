require "rails_helper"

#Controller Testing 

RSpec.describe ReviewsController, :type => :controller do
    context 'POST create' do
      it 'should create a new review' do
        params =
         {
         comment: 'Perfect Host. I advise everyone to work here.',
         rating: '5'
         }
         expect { post(:create, params: { review: params }) }
       end
      end

    #Routes Testing
     describe 'routing' do
        it 'routes to #new' do
            expect(get: 'users/1/reviews/new').to route_to('reviews#new', user_id: '1')
        end 
    end     
end