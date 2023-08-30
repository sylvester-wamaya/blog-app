# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create([{id: 1, name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.'}, 
    {id: 2, name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.'}])
Post.create([{author_id: 1, title: 'Hello', text: 'This is my first post'}, {author_id: 1, title: 'Hello', text: 'This is my first post'}])
Comment.create([{post_id: 1, author_id: 2, text: 'Hi Tom!' }, {post_id: 1, author_id: 2, text: 'Hi Tom!' }])