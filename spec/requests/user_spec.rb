require 'rails_helper'

RSpec.describe 'users_controller', type: :request do
  describe 'GET /users' do
    it 'Should return a success http status, correct template and include correct placeholder text' do
      get '/users'

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include('Here is the list of all Users')
    end
  end

  describe 'GET /users/:id' do
    it 'Should return a success http status, correct template and include correct placeholder text' do
      user = User.create(name: 'Tom')

      get "/users/#{user.id}"

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).to include('Tom')
    end
  end
end
