require 'rails_helper'

RSpec.describe User, type: :model do
    subject {User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')}

    before {subject.save}

    describe 'validations' do
        it 'Name should be present' do
            subject.name = nil 
            expect(subject).to_not be_valid
        end
        it 'posts_counter should be an integer' do
            subject.posts_counter = 1.1
            expect(subject).to_not be_valid
        end
        it 'posts_counter should be equal to or greater than 0' do
            subject.posts_counter = -1
            expect(subject).to_not be_valid
        end
    end
    describe '#recent_posts' do
        it 'Returns 3 of the most recent posts' do
            first_post = subject.posts.create(title: 'first post', text: 'first content')
            second_post = subject.posts.create(title: 'second post', text: 'second content')
            third_post = subject.posts.create(title: 'third post', text: 'third content')
            fourth_post = subject.posts.create(title: 'fourth post', text: 'fourth content')

            expect(subject.recent_posts).to eq([fourth_post, third_post, second_post])
        end
  end
end