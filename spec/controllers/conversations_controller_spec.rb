require "rails_helper"

#Controller Testing 

RSpec.describe ConversationsController, :type => :controller do
    describe "GET index" do
        it "should get index page" do
          sign_in (create(:user))
          get :index
          expect(response).to have_http_status(200)
          expect(response).to render_template :index
        end
    end
    context 'POST create' do
      it 'should create a new conversation' do
        params =
         {
         sender_id: '1',
         recipient_id: '2'
         }
         expect { post(:create, params: { conversation: params }) }
       end
      end

    #Test routes
      describe 'routing' do

        it 'routes to #index' do
         expect(get: '/conversations').to route_to('conversations#index')
        end
      end
end