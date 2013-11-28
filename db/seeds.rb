require 'faker'
require 'pry'

wikis = []
15.times do 
  wikis << Wiki.create(
    topic: Faker::Lorem.words(rand(1..5)).join(" "),
    description: Faker::Lorem.paragraph(1))
end

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