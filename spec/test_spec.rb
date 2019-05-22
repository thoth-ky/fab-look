# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IndexController, type: :controller do
  describe 'GET #index' do
    it 'redirects unlogged in users' do
      get :index
      expect(response).to have_http_status(302)
      expect(response).to redirect_to('/users/sign_in')
    end

    it 'renders the index template' do
      user = create(:user)
      sign_in(user)
      get :index
      assert_template('index/index')
    end
  end
end
