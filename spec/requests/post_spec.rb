require 'rails_helper'

RSpec.describe 'Posts_controller', type: :request do
    let(:user) { User.create(name: 'Tom') }

  describe 'GET /users/:user_id/posts' do
    it 'Should return a success http status, correct template and include correct placeholder text' do
      
      get "/users/#{user.id}/posts"

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include('Here is the list of all Posts')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'Should return a success http status, correct template and include correct placeholder text' do
      post = Post.create(author_id: user.id, title: 'Blog')

      get "/users/#{user.id}/posts/#{post.id}"

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).to include('Blog')
    end
  end
end