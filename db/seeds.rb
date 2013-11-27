require 'faker'
require 'pry'

wikis = []
15.times do 
  wikis << Wiki.create(
    topic: Faker::Lorem.words(rand(1..5)).join(" "),
    description: Faker::Lorem.paragraph(1))
end
#binding.pry 

rand(4..10).times do 
  wiki = wikis.first
  a = wiki.articles.create(
    wiki: wiki,
    title: Faker::Lorem.words(rand(1..5)).join(" "),
    body: Faker::Lorem.paragraphs(rand(1..2)).join("\n"))
    a.update_attributes(:created_at, Time.now - rand(600..315360000))
    wikis.rotate!
end


puts "#{Wiki.count} Wikis created"
puts "#{Article.count} Articles created"