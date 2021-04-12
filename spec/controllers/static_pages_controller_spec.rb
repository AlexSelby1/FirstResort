require "rails_helper"

#Controller Testing 

RSpec.describe StaticPagesController, :type => :controller do
    context 'GET #home' do
        it 'returns homepage' do
        get :home
        expect(response).to render_template(layout: :application) # layout
        end
    end

    #Test routes
        describe 'routing' do
            it 'routes to #home' do
             expect(get: '/').to route_to('static_pages#home')
            end
        end
end