require "rails_helper"

#Controller Testing 

RSpec.describe MessagesController, :type => :controller do
    describe "GET index" do
        let(:sender) { create(:user) }
        let(:recipient) { build(:user, email:'alex@gmail.com') }
        it "should get index page" do
            conversation = FactoryBot.create(:conversation, sender: sender, recipient: recipient) 
            get :index, params: { conversation_id: conversation.id }
          expect(response).to have_http_status(200)
          expect(response).to render_template :index
        end
    end
    context 'POST create' do
      it 'should create a new message' do
        params =
         {
         conversation_id: '1',
         user_id: '2',
         body: 'Hello. This is a test'
         }
         expect { post(:create, params: { conversation: params }) }
       end
      end

    #Test routes
      describe 'routing' do

        it 'routes to #index' do
         expect(get: '/conversations/1/messages').to route_to('messages#index', conversation_id: '1')
        end
      end
end