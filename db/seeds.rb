# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Band.destroy_all

ApplicationRecord.connection.reset_pk_sequence!('users')
ApplicationRecord.connection.reset_pk_sequence!('bands')

Band.create(
  [
    {name: 'Nirvana'},
    {name: 'Pearl Jam'},
    {name: 'Smashing Pumpkins'},
    {name: 'Green Day'}
  ]
)

User.create(
  [
    {email: 'john', password: 'beatles'},
    {email: 'paul', password: 'beatles'},
    {email: 'ringo', password: 'beatles'},
    {email: 'george', password: 'beatles'}
  ]
)
