require_relative '../../minitest_helper'

class Admin::StatisticsTest 
  describe 'Statistics Integration', :js => true do
    it 'should find the data on the visitor statistics on chart' do
      @user = FactoryGirl.create(:user, name: 'Example User', email: 'user@example.com', password: 'qwerty', password_confirmation: 'qwerty')
      @visit1 = Visit.create(ip: '255.255.255.0', browser: 'Opera', browser_version: '46.265.78.675', os_name: 'Windows', os_version: '8.1', device: "Computer",
  	           created_at: Time.now - rand(100).days)
      @visit2 = Visit.create(ip: '255.255.255.1', browser: 'IE', browser_version: '46.265.78.426', os_name: 'Linux', os_version: 'i686', device: "Computer",
  	           created_at: Time.now - rand(100).days)
      @visit3 = Visit.create(ip: '255.255.255.2', browser: 'Safari', browser_version: '46.265.78.455', os_name: 'Mac OS X', os_version: 'Mavericks', device: "Computer",
  	           created_at: Time.now - rand(100).days)
      visit admin_statistics_path
      find('path', match: :first)['d'].must_have_content("M 394.5 3.5 L 394.5 9.333333333333334 M 397.5 3.5 L 397.5 9.333333333333334 M 400.5 3.5 L 400.5 9.333333333333334")
    end
  end
end	