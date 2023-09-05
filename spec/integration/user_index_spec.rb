require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
    before(:each) do
        @user1 = User.create(name:'Tom', photo:'https://media.istockphoto.com/id/1386479313/photo/happy-millennial-afro-american-business-woman-posing-isolated-on-white.jpg?s=1024x1024&w=is&k=20&c=5OK7djfD3cnNmQ-DR0iQzF-vmA-iTNN1TbuEyCG1DfA=', bio: 'Tom bio')
        @user2 = User.create(name: 'Lilly', photo: 'https://media.istockphoto.com/id/1388253782/photo/positive-successful-millennial-business-professional-man-head-shot-portrait.jpg?s=1024x1024&w=is&k=20&c=v0FzN5RD19wlMvrkpUE6QKHaFTt5rlDSqoUV1vrFbN4=', bio: 'Lilly bio')

        visit users_path

    end
    describe 'Displaying user information' do
        it 'Should display names of all the users' do
            expect(page).to have_content('Tom')
            expect(page).to have_content('Lilly')
        end
        it 'Should display user photos' do
            expect(page).to have_css("img[src*='https://media.istockphoto.com/id/1386479313/photo/happy-millennial-afro-american-business-woman-posing-isolated-on-white.jpg?s=1024x1024&w=is&k=20&c=5OK7djfD3cnNmQ-DR0iQzF-vmA-iTNN1TbuEyCG1DfA=']", visible: :visible)
            expect(page).to have_css("img[src*='https://media.istockphoto.com/id/1388253782/photo/positive-successful-millennial-business-professional-man-head-shot-portrait.jpg?s=1024x1024&w=is&k=20&c=v0FzN5RD19wlMvrkpUE6QKHaFTt5rlDSqoUV1vrFbN4=']", visible: :visible)

        end
        it 'Should display users post counter' do
            expect(page).to have_content("Number of posts: #{@user1.posts_counter}")
            expect(page).to have_content("Number of posts: #{@user2.posts_counter}")
        end
    end
    it 'Should redirect to user profile when user is clicked' do
        click_link 'Tom'
        expect(page).to have_current_path(user_path(@user1))
    end
end