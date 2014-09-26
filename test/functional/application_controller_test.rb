require_relative '../minitest_helper'

class ApplicationControllerTest
	describe ApplicationController do
		
		class UAStub
			def device
				Device.new
				
			end
		end

		class Device
			def to_s
				'mobile'
			end
			def engine
				Engine.new
			end
			def operating_system
				Os.new
			end
		end
		
		class Os
			def name
				'Windows'
			end
			def version
				'8'
			end
		end

		class Engine
			def to_s
			 "Firefox"
			end
			def browser
				Browser.new
			end
		end

		class Browser
			def version
				"123"
			end
			def name
		  "Firefox"
			end
		end



		it 'it should check db on visit data presence' do
			stub(AgentOrange::UserAgent).new() {UAStub.new}
			@controller = PagesController.new
	   	get :index
			
			visit = Visit.first
			visit.ip.must_equal '0.0.0.0'
			visit.browser.must_equal 'Firefox'
			visit.browser_version.must_equal '123'
			visit.os_name.must_equal 'Windows'
			visit.os_version.must_equal '8'
			visit.device.must_equal 'mobile'
		end
	end
end