require 'faker'
require 'pry'

u1 = User.new(
        email: "orrett.davis@gmail.com", 
        password: "hello",  
        password_confirmation: "hello",
        name: "Orrett Davis ")
        u1.update_attribute(:created_at, Time.now - rand(600..325360000))
        u1.save
        u1.update_attribute(:role, "admin")

u2 = User.new(
        email: "admin@example.com", 
        password: "hello",  
        password_confirmation: "hello",
        name: "Admin User ")
        u2.update_attribute(:created_at, Time.now - rand(600..325360000))
        u2.save
        u2.update_attribute(:role, "member")


wikis = []
10.times do 
  w = u1.wikis.create(
    topic: Faker::Lorem.words(rand(1..5)).join(" "),
    description: Faker::Lorem.paragraph(1))
    w.update_attribute(:privacy, [true,false].sample)
  wikis << w 
end

#binding.pry

rand(50..100).times do 
  wiki = wikis.first
  a = wiki.articles.create(
    wiki: wiki,
    title: Faker::Lorem.words(rand(1..5)).join(" "),
    body: Faker::Lorem.paragraphs(rand(1..2)).join("\n"))
    a.update_attribute(:created_at, Time.now - rand(600..315360000))
    wikis.rotate!
end



puts "#{Wiki.count} Wikis created"
puts "#{Article.count} Articles created"