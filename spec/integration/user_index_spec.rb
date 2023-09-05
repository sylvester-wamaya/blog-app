require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'Tom',
                         photo: 'https://cdn.pixabay.com/photo/2015/06/22/08/40/child-817373_1280.jpg',
                         bio: 'Tom bio')
    @user2 = User.create(name: 'Lilly',
                         photo: 'https://cdn.pixabay.com/photo/2015/06/22/08/40/child-817373_1280.jpg',
                         bio: 'Lilly bio')

    visit users_path
  end
  describe 'Displaying user information' do
    it 'Should display names of all the users' do
      expect(page).to have_content('Tom')
      expect(page).to have_content('Lilly')
    end
    it 'Should display user photos' do
      expect(page).to have_css(
        "img[src*='https://cdn.pixabay.com/photo/2015/06/22/08/40/child-817373_1280.jpg']",
        visible: :visible
      )
      expect(page).to have_css(
        "img[src*='https://cdn.pixabay.com/photo/2015/06/22/08/40/child-817373_1280.jpg']", visible: :visible
      )
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
