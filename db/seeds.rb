# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Band.destroy_all
Album.destroy_all
Track.destroy_all

ApplicationRecord.connection.reset_pk_sequence!('users')
ApplicationRecord.connection.reset_pk_sequence!('bands')
ApplicationRecord.connection.reset_pk_sequence!('albums')
ApplicationRecord.connection.reset_pk_sequence!('tracks')

User.create(
  [
    {email: 'john', password: 'beatles'},
    {email: 'paul', password: 'beatles'},
    {email: 'ringo', password: 'beatles'},
    {email: 'george', password: 'beatles'}
  ]
)

Band.create(
  [
    {name: 'Nirvana'},
    {name: 'Smashing Pumpkins'},
    {name: 'Pearl Jam'},
    {name: 'Green Day'}
  ]
)

Album.create(
  [
    {title: 'Nevermind', year: 1991, band_id: 1, studio: true},
    {title: 'Nirvana MTV Unplugged in New York', year: 1994, band_id: 1, studio: false},
    {title: 'Mellon Collie and the Infinite Sadness', year: 1995, band_id: 2, studio: true}
  ]
)
