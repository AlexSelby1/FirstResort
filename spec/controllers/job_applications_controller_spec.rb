require "rails_helper"

RSpec.describe JobApplicationsController, :type => :controller do
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
        job_application = create(:job_application, user:user)
          get :show, params: { id: job_application.id }
          expect(response).to have_http_status(200)
          expect(response).to render_template :show
         end
        end
        

        context 'POST create' do
          let!(:user) { FactoryBot.create :user }
          let!(:job_application) { FactoryBot.create :job_application, user:user }
 
          it 'should create a new job application' do
          
            params =
             {
             title: 'Barman required',
             country: 'Ireland',
             category: 'Bar',
             description: 'blah blah blah'
             }
            
             expect { post(:create, params: { job_application: params }) }
             expect(:notice)
           end
          end

            context 'DELETE #destroy' do
              let!(:user) { FactoryBot.create :user }
              let!(:job_application) { FactoryBot.create :job_application, user:user }
             
             it 'should delete job application' do
                expect { delete :destroy, params: { id: job_application.id } }
                expect(:notice)
               end
              end

          describe 'routing' do

            it 'routes to #index' do
             expect(get: '/job_applications').to route_to('job_applications#index')
            end
          
            it 'routes to #show' do
             expect(get: '/job_applications/1').to route_to('job_applications#show', id: '1')
            end
          
            it 'routes to #new' do
             expect(get: '/job_applications/new').to route_to('job_applications#new')
            end
           
            
            it 'routes to #update via PATCH' do
             expect(patch: '/job_applications/1').to route_to('job_applications#update', id: '1')
            end
           end
        end
