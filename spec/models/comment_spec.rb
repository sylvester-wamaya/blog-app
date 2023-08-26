require 'rails_helper'

RSpec.describe Like, type: :like do
    let (:user) {User.create(name: 'Tom')}
    let (:post) {Post.create(user:, title: 'Post title', text: 'Post content')}
    let (:comment) {Comment.create(user:, post:, text: 'Comment')}

    describe 'Comments_count change' do
        it 'Should increment comments_counter on after comment creation' do
            expect {comment}.to change {post.reload.comments_counter}.by(1)          

        end
        it 'should decremnt comments_counter on destroy' do
            comment
            expect {comment.destroy}.to change {post.reload.comments_counter}.by(-1)
            
        end
    end
    
end