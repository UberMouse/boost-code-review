# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

compass_points = %w(north east south west)
dnz = %w(Taylor Eddy Yar Jeffery)
natlib = %w(Richard Ben Oliver Dan)

dnz.zip(compass_points).each {|(name, cp)| Reviewer.create(name: name, compass_point: cp, team: 'dnz')}
natlib.zip(compass_points).each {|(name, cp)| Reviewer.create(name: name, compass_point: cp, team: 'natlib')}
