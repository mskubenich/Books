require_relative '../../minitest_helper'

class Admin::StatisticsTest 
  describe 'Statistics Integration', :js => true do
    it 'should find the data on the visitor statistics on chart' do
      @user = FactoryGirl.create(:user, name: 'Example User', email: 'user@example.com', password: 'qwerty', password_confirmation: 'qwerty')   
      @visit = Visit.create(ip: '255.255.255.0', browser: 'Opera', browser_version: '46.265.78.675', os_name: 'Windows', os_version: '8.1', device: "Computer",
  	           			   created_at: Time.now - rand(100).days)    
      visit admin_statistics_path

      find('path', match: :first)['d'].must_equal("M 456.5 3.5 L 456.5 9.333333333333334 M 459.5 3.5 L 459.5 9.333333333333334 M 462.5 3.5 L 462.5 9.333333333333334")
    end

    it 'should find the data on the device statistics on chart' do
       @user = FactoryGirl.create(:user, name: 'Example User', email: 'user@example.com', password: 'qwerty', password_confirmation: 'qwerty')  	
       @visit = Visit.create(ip: '255.255.255.0', browser: 'Opera', browser_version: '46.265.78.675', os_name: 'Windows 8', os_version: '8.1', device: "Computer",
  	           			   created_at: Time.now - rand(100).days) 
       visit admin_statistics_path

       find('#container3 path', match: :first)['d'].must_equal('M 6 6.5 L 20 6.5 M 6 11.5 L 20 11.5 M 6 16.5 L 20 16.5')
    end	
  end
end
