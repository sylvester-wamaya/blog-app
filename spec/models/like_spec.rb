require 'rails_helper'

RSpec.describe Like, type: :like do
    let (:user) {User.create(name: 'Tom')}
    let (:post) {Post.create(user:, title: 'Post title', text: 'Post content')}

    describe 'Likes_counter change' do
        it 'Should increment likes_counter on likes creation' do
            expect do
            like = Like.create(user:, post:)
            end.to change {post.reload.likes_counter}.by(1)          

        end
        it 'should decremnt likes_counter on destroy' do
            like = Like.create(user:, post:)
            expect do
                like.destroy
            end.to change {post.reload.likes_counter}.by(-1)
            
        end
    end
    
end