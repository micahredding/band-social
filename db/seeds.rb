# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Band.destroy_all

jms = Band.new(name: "Jams", description: "Hey, its our first band.", manager_id: User.all.sample.id)
if jms.save
  puts "Done"
else
  puts "Incomplete"
end
