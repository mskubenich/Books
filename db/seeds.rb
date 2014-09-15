browsers = ['Chrome', 'Opera', 'IE']
os_names = ['Linux', 'Windows']
os_versions = ['i686', '64 bit']
ip_address = "#{rand(255)}.#{rand(255)}.#{rand(255)}.#{rand(255)}"
browser_versions = "#{rand(99)}.#{rand(10)}.#{rand(3000)}.#{rand(99)}"

100.times do |i|
  Visit.create(ip: ip_address, browser: browsers[rand(2)], browser_version: browser_versions, os_name: os_names[rand(1)], os_version: os_versions[rand(1)], device: "Computer",
  	           created_at: Time.now - rand(100).days)
end