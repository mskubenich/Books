# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Book.create(title: 'The Old Man And The Sea', description: 'Ernest Hemingway', year: 1952, language: 'English', pages: 127)
Book.create(title: 'The Idiot', description: 'Fyodor Dostoevsky', year: 1969, language: 'Russian', pages: 0)
Book.create(title: 'The Kobzar', description: 'Taras Shevchenko', year: 1840, language: 'Ukrainian', pages: 0)