require "rails_helper"

#Controller Testing

RSpec.describe JobsController, :type => :controller do
    describe "GET index" do
        it "should get index page" do
          get :index
          expect(response).to have_http_status(200)
          expect(response).to render_template :index
        end
    end
    context 'GET show'  do
       it 'should and get show page' do
        user = create(:user)
        job = create(:job, user:user)
          get :show, params: { id: job.id }
          expect(response).to have_http_status(200)
          expect(response).to render_template :show
         end
        end
        

        context 'POST create' do
          let!(:user) { FactoryBot.create :user }
          let!(:job) { FactoryBot.create :job, user:user }
 
          it 'should create a new job' do
          
            params =
             {
             title: 'Barman required',
             country: 'Ireland',
             category: 'Bar',
             description: 'blah blah blah'
             }
            
             expect { post(:create, params: { job: params }) }
             expect(:notice)
           end
          end

            context 'DELETE #destroy' do
              let!(:user) { FactoryBot.create :user }
              let!(:job) { FactoryBot.create :job, user:user }
             
             it 'should delete job' do
                expect { delete :destroy, params: { id: job.id } }
                expect(:notice)
               end
              end

          #Routes Testing
          describe 'routing' do

            it 'routes to #index' do
             expect(get: '/jobs').to route_to('jobs#index')
            end
          
            it 'routes to #show' do
             expect(get: '/jobs/1').to route_to('jobs#show', id: '1')
            end
          
            it 'routes to #new' do
             expect(get: '/jobs/new').to route_to('jobs#new')
            end
            
            it 'routes to #update via PATCH' do
             expect(patch: '/jobs/1').to route_to('jobs#update', id: '1')
            end
           end
        end
