require 'rails_helper'

RSpec.describe 'User posts index page', type: :feature do
    before(:each) do
        @user1 = User.create(name:'Tom', photo:'https://media.istockphoto.com/id/1386479313/photo/happy-millennial-afro-american-business-woman-posing-isolated-on-white.jpg?s=1024x1024&w=is&k=20&c=5OK7djfD3cnNmQ-DR0iQzF-vmA-iTNN1TbuEyCG1DfA=', bio: 'Tom bio')
        @post1 = Post.create(author_id: @user1.id, title: 'Hello', text: 'This is my first post')
        @post2 = Post.create(author_id: @user1.id, title: 'Hi', text: 'This is my second post')

        visit user_posts_path(@user1)
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
    describe "Display posts" do
        it 'Should display all posts' do
            expect(page).to have_content(@post1.text)
            expect(page).to have_content(@post2.text)
        end
    end
    

    it 'Should display the all posts' do
        expect(page).to have_content(@post1.text)
        expect(page).to have_content(@post2.text)
    end

    describe "Test links" do
        it 'Should redirect to a specific post when post title is clicked' do
            click_link @post1.title
            expect(page).to have_current_path(user_post_path(@user1, @post1))
        end

        it 'Should redirect to the user when Back to user is clicked' do
            click_link 'Back to user'
            expect(page).to have_current_path(user_path(@user1))
        end
    end
end


