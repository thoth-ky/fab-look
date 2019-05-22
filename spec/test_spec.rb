require 'rails_helper'

 RSpec.describe IndexController, type: :controller do
  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

     it 'renders the index template' do
      get :index
      assert_template('index/index')
    end
  end
end