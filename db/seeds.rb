# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def seed_users
  user_id = 0
  10.times do
    User.create(
      username: "test#{user_id}",
      email: "test#{user_id}@test.com",
      password: 'azerty',
      password_confirmation: 'azerty'
    )
    user_id = user_id + 1
  end
end

def seed_posts
  categories = Category.all

  categories.each do |category|
    5.times do
      Post.create(
        title: Faker::Lorem.sentences[0], 
        content: Faker::Lorem.sentences[0], 
        user_id: rand(1..9), 
        category_id: category.id
      )
    end
  end
end

def seed_comments
  posts = Post.all

  posts.each do |post|
    5.times do
      Comment.create(
        content: Faker::Lorem.sentences[0], 
        user_id: rand(1..9), 
        post_id: post.id
      )
      Comment.create(
        content: Faker::Lorem.sentences[0], 
        user_id: 11, 
        post_id: post.id
      )
    end
  end
end

seed_users
seed_posts
seed_comments
