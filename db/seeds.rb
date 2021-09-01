# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Start seeding"
Comment.destroy_all
Tweet.destroy_all
User.destroy_all


puts "Seeding users..."

User.find_or_create_by(username: "monito") do |user|
  user.email = "monito@test.com"
  user.name = "David"
  user.password = "123456"
end

rand(3..7).times do
  user_data = {
    name: Faker::Name.name,
    username: Faker::Internet.username,
    email: Faker::Internet.email(domain: 'example'),
    password: Faker::Internet.password(min_length: 6)
  }
  new_user = User.new(user_data)
  puts "User not created.\nErrors: #{new_user.errors.full_messages}" unless new_user.save
end
puts "Finish seeding"

puts "Seeding tweets..."
users = User.all

users.each do |user|
  rand(1..3).times do
    tweet_data = {
      body: [Faker::Lorem.sentence(word_count: 6, supplemental: true),
             Faker::Lorem.paragraph,
             Faker::Lorem.question].sample,

      user: user
    }
    new_tweet = user.tweets.new(tweet_data)
    puts "Tweet not created.\nErrors: #{new_tweet.errors.full_messages}" unless new_tweet.save
  end
end
puts "Finish seeding"

puts "Seeding comments..."
tweets = Tweet.all

tweets.each do |tweet|
  rand(0..2).times do
    comment_data = {
      body: [Faker::Lorem.sentence(word_count: 6, supplemental: true),
             Faker::Lorem.paragraph,
             Faker::Lorem.question].sample,
      tweet: tweet,
      user: users.sample
    }
    new_comment = tweet.comments.new(comment_data)
    puts "Tweet not created.\nErrors: #{new_comment.errors.full_messages}" unless new_comment.save
  end
end

puts "Finish seeding"
