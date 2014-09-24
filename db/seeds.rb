browsers = ['Chrome', 'Opera', 'IE']
os_names = ['Linux', 'Windows']
os_versions = ['i686', '64 bit']
ip_address = "#{rand(255)}.#{rand(255)}.#{rand(255)}.#{rand(255)}"
browser_versions = "#{rand(99)}.#{rand(10)}.#{rand(3000)}.#{rand(99)}"

100.times do |i|
  Visit.create(ip: ip_address, browser: browsers[rand(2)], browser_version: browser_versions, os_name: os_names[rand(1)], os_version: os_versions[rand(1)], device: "Computer",
  	           created_at: Time.now - rand(100).days)
end

Role.destroy_all
admin_role = Role.create name: 'admin'
user_role = Role.create name: 'user'

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
