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

browsers = ['Chrome', 'Opera', 'IE']
os_names = ['Linux', 'Windows']
os_versions = ['i686', '64 bit']
ip_address = "#{rand(255)}.#{rand(255)}.#{rand(255)}.#{rand(255)}"
browser_versions = "#{rand(99)}.#{rand(10)}.#{rand(3000)}.#{rand(99)}"

100.times do |i|
  Visit.create(ip: ip_address, browser: browsers[rand(2)], browser_version: browser_versions, os_name: os_names[rand(2)], os_version: os_versions[rand(2)], device: "Computer",
  	          created_at: Time.now - rand(100).days)
end
