require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
    before(:each) do
        @user1 = User.create(name:'Tom', photo:'https://media.istockphoto.com/id/1386479313/photo/happy-millennial-afro-american-business-woman-posing-isolated-on-white.jpg?s=1024x1024&w=is&k=20&c=5OK7djfD3cnNmQ-DR0iQzF-vmA-iTNN1TbuEyCG1DfA=', bio: 'Tom bio')
        @post1 = Post.create(author_id: @user1.id, title: 'Hello', text: 'This is my first post')
        @post2 = Post.create(author_id: @user1.id, title: 'Hello', text: 'This is my first post')

        visit user_path(@user1)
    end
    describe 'Display a specific user details and posts' do
        it 'Should display the name of the user' do
            expect(page).to have_content(@user1.name)
        end
        it 'Should display the user photo' do
            expect(page).to have_css("img[src*='https://media.istockphoto.com/id/1386479313/photo/happy-millennial-afro-american-business-woman-posing-isolated-on-white.jpg?s=1024x1024&w=is&k=20&c=5OK7djfD3cnNmQ-DR0iQzF-vmA-iTNN1TbuEyCG1DfA=']", visible: :visible)
        end
        it 'Should display the posts likes counter and comments counter' do
            expect(page).to have_content("Comments: #{@post1.comments_counter}, Likes: #{@post1.likes_counter}")
            expect(page).to have_content("Comments: #{@post2.comments_counter}, Likes: #{@post2.likes_counter}")
        end
    end
    describe "Test links" do
        it 'Should redirect to user posts when See all posts is clicked' do
            click_link 'See all posts'
            expect(page).to have_current_path(user_posts_path(@user1))
        end
        it 'Should redirect to users when Back to users is clicked' do
            click_link 'Back to users'
            expect(page).to have_current_path(users_path)
        end

    end
end