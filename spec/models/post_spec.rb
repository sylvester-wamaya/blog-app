require 'rails_helper'

RSpec.describe Post, type: :post do
  let(:user) { User.create(name: 'Tom') }
  subject { Post.new(user:, title: 'Hello', text: 'This is my first post') }

  before { subject.save }

  describe 'validations' do
    it 'Title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end
    it 'Tilte must not exceed 250 characters' do
      subject.title = 'a' * 251
      expect(subject).to_not be_valid
    end
    it 'comments_counter should be an integer' do
      subject.comments_counter = 1.1
      expect(subject).to_not be_valid
    end
    it 'comments_counter should be equal to or greater than 0' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
    it 'likes_counter should be an integer' do
      subject.likes_counter = 1.1
      expect(subject).to_not be_valid
    end
    it 'likes_counter should be equal to or greater than 0' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe 'posts_counter change' do
    it 'Should increment posts_counter on post creation' do
      expect do
        Post.create(user:, title: 'Hello', text: 'This is my first post')
      end.to change { user.reload.posts_counter }.by(1)
    end
    it 'Should decrement posts_counter on post destroy' do
      post = Post.create(user:, title: 'Hello', text: 'This is my first post')
      expect do
        post.destroy
      end.to change { user.reload.posts_counter }.by(-1)
    end
  end
  describe '#recent_comments' do
    it 'Should return the 5 most recent comments' do
      post = Post.create(user:, title: 'Hello', text: 'This is my first post', comments_counter: 5)
      older_comment = Comment.create(post:, text: 'Older comment')
      expect(post.recent_comments).not_to include(older_comment)
    end
  end
end
