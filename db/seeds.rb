admin_role = Role.create(name: admin)
user_role = Role.create(name: user)

user = User.new(email: "admin@gmail.com", password: "secret", name: "admin")
user.roles << Role.first
user.save

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
