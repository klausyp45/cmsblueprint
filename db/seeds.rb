# db/seeds.rb
require 'faker'

puts "Cleaning database..."
User.destroy_all
Post.destroy_all
Page.destroy_all
Comment.destroy_all
Like.destroy_all

puts "Creating admin user..."
admin = User.create!(
  email: "admin@example.com",
  password: "password",
  password_confirmation: "password",
  admin: true
)

puts "Creating regular users..."
5.times do |i|
  user = User.create!(
    email: "user#{i+1}@example.com",
    password: "password",
    password_confirmation: "password"
  )
  puts "Created user: #{user.email}"
end

puts "Creating pages..."
about_page = Page.create!(
  title: "About Us",
  slug: "about",
  content: Faker::Lorem.paragraphs(number: 5).join("\n\n"),
  published: true
)

contact_page = Page.create!(
  title: "Contact",
  slug: "contact",
  content: Faker::Lorem.paragraphs(number: 3).join("\n\n") + "\n\nEmail: #{Faker::Internet.email}",
  published: true
)

puts "Creating posts..."
post_types = ["blog", "event", "news"]
users = User.all

20.times do |i|
  post = Post.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    body: Faker::Lorem.paragraphs(number: rand(3..10)).join("\n\n"),
    post_type: post_types.sample,
    user: users.sample,
    created_at: rand(1..30).days.ago
  )
  
  # Add comments to posts
  rand(0..5).times do
    post.comments.create!(
      body: Faker::Lorem.paragraph(sentence_count: rand(1..3)),
      user: users.sample,
      created_at: rand(1..20).days.ago
    )
  end
  
  # Add likes to posts
  users.sample(rand(0..users.count)).each do |user|
    post.likes.create!(user: user) unless rand > 0.7 # 70% chance to like
  end
  
  puts "Created #{post.post_type} post: #{post.title}"
end

puts "Creating sample comments on comments..."
Comment.where(commentable_type: ["Post", "Comment"]).limit(10).each do |parent_comment|
  next unless parent_comment.commentable_type.in?(["Post", "Comment"]) # Additional safety check
  
  rand(0..2).times do
    parent_comment.comments.create!(
      body: Faker::Lorem.paragraph(sentence_count: rand(1..3)),
      user: users.sample,
      created_at: rand(1..10).days.ago
    )
  end
end

puts "Finished seeding!"
puts "Admin credentials: email: admin@example.com / password: password"