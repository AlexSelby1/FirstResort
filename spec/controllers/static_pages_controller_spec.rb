require "rails_helper"

RSpec.describe StaticPagesController, :type => :controller do
    context 'GET #home' do
        it 'returns homepage' do
        get :home
        expect(response).to render_template(layout: :application) # layout
        end
        
    end
end