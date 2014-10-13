puts 'Create roles ...'
Role.destroy_all
admin_role = Role.create name: 'admin'
user_role = Role.create name: 'user'

puts 'Create users ...'
User.destroy_all
User.create name: 'Admin',
            email: 'admin@example.com',
            role_id: admin_role.id,
            password: 'foobar',
            password_confirmation: 'foobar'

User.create name: 'User',
            email: 'user@example.com',
            role_id: user_role.id,
            password: 'foobar',
            password_confirmation: 'foobar'


puts 'Create books ...'
Book.create(title: 'The Old Man And The Sea', description: 'Ernest Hemingway', year: 1952, language: 'English', pages: 127)
Book.create(title: 'The Idiot', description: 'Fyodor Dostoevsky', year: 1969, language: 'Russian', pages: 0)
Book.create(title: 'The Kobzar', description: 'Taras Shevchenko', year: 1840, language: 'Ukrainian', pages: 0)

puts 'Create visits ...'
browsers = ['Firefox ', 'Chrome', 'Opera ', 'Safari', 'IE', 'Others']
os_names = ['Linux', 'Windows 8', 'Mac OS X', 'Windows XP', 'Windows Seven']
os_versions = ['i686', '64 bit']
ip_address = "#{rand(255)}.#{rand(255)}.#{rand(255)}.#{rand(255)}"
browser_versions = "#{rand(99)}.#{rand(10)}.#{rand(3000)}.#{rand(99)}"

100.times do |i|
  Visit.create(ip: ip_address, browser: browsers[rand(6)], browser_version: browser_versions, os_name: os_names[rand(5)], os_version: os_versions[rand(2)], device: "Computer",
  	          created_at: Time.now - rand(100).days)
end

