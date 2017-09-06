# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# champions = Champion.create([
#   {name: 'Aurelion Sol'},
#   {name: 'Twisted Fate'},
#   {name: 'Graves'},
#   {name: 'Gnar'}
# ])

10.times do
  champions = Champion.create([
    { name: Faker::Name.name }
  ])
end

10.times do
  items = Item.create([
    { name: Faker::Zelda.character }
  ])
end
