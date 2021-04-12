require "rails_helper"

#Controller Testing

RSpec.describe JobApplicationsController, :type => :controller do
    describe "GET index" do
        it "should get index page" do
          user = FactoryBot.build(:user)
          job = FactoryBot.create(:job, user:user) 
          sign_in(user)
          get :index, params: { job_id: job.id }
          expect(response).to have_http_status(200)
          expect(response).to render_template :index
        end
    end

    context 'POST create' do

      it 'should create a new job application' do
        host = FactoryBot.create(:user)
        job = FactoryBot.create(:job, user:host) 
        candidate = FactoryBot.build(:user, :isCandidate => 'true', :isHost => 'false')
        params =
         {
         applicant_id: candidate.id,
         job_id: job.id,
         owner_id: host.id,
         }
        
         expect { post(:create, params: { job_applications: params }) }
         expect(:notice)
       end
      end
      context 'DELETE #destroy' do
       it 'should delete job application' do
        host = FactoryBot.create(:user)
        job = FactoryBot.create(:job, user:host) 
        candidate = FactoryBot.build(:user, :isCandidate => 'true', :isHost => 'false')
        job_application = FactoryBot.build(:job_application, applicant_id: candidate.id, job_id: job.id)
        
          expect { delete :destroy, params: { id: job_application.id } }
          expect(:notice)
         end
        end

        context 'DELETE #toggle_accept' do
          it 'should accept job application' do
           host = FactoryBot.create(:user)
           job = FactoryBot.create(:job, user:host) 
           candidate = FactoryBot.build(:user, :isCandidate => 'true', :isHost => 'false')
           job_application = FactoryBot.build(:job_application, applicant_id: candidate.id, job_id: job.id)

             change { job_application.reload.isAccepted}.from(false).to(true)
             expect(:notice)
            end
           end

    #Routes Testing
    describe 'routing' do
        
      it 'routes to #index' do
        expect(get: '/jobs/1/job_applications').to route_to('job_applications#index', job_id: '1')
      end
    end
end