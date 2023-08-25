require 'rails_helper'

RSpec.describe Post, type: :post do
    subject {Post.new(author_id: 1, title: 'Hello', text: 'This is my first post')}

    before {subject.save}

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