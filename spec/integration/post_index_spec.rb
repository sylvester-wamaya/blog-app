require 'rails_helper'

RSpec.describe 'User posts index page', type: :feature do
    before(:each) do
        @user1 = User.create(name:'Tom', photo:'https://media.istockphoto.com/id/1386479313/photo/happy-millennial-afro-american-business-woman-posing-isolated-on-white.jpg?s=1024x1024&w=is&k=20&c=5OK7djfD3cnNmQ-DR0iQzF-vmA-iTNN1TbuEyCG1DfA=', bio: 'Tom bio')
        @post1 = Post.create(author_id: @user1.id, title: 'Hello', text: 'This is my first post')
        @post2 = Post.create(author_id: @user1.id, title: 'Hi', text: 'This is my second post')

        visit user_path(@user1)
    end
    describe 'Display a specific user details and posts' do
        it 'Should display the name of the user' do
            expect(page).to have_content(@user1.name)
        end
        it 'Should display the user photo' do
            expect(page).to have_css("img[src*='https://media.istockphoto.com/id/1386479313/photo/happy-millennial-afro-american-business-woman-posing-isolated-on-white.jpg?s=1024x1024&w=is&k=20&c=5OK7djfD3cnNmQ-DR0iQzF-vmA-iTNN1TbuEyCG1DfA=']", visible: :visible)
        end
        it 'Should display user post counter' do
            expect(page).to have_content("Number of posts: #{@user1.posts.count}")
        end
    end
end