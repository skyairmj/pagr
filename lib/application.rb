require File.dirname(__FILE__) + "/pages"

class Application
	attr_reader :ie
	
  include Pages
	
	def initialize ie
		@ie = ie
		@host = ENV['FUNCTIONAL_TEST_SERVER_HOST']
		@port = ENV['FUNCTIONAL_TEST_SERVER_PORT']
		@app = ENV['FUNCTIONAL_TEST_APPLICATION']
	end
	
	def start
		@ie.goto "http://#{@host}:#{@port}/#{@app}/System/Login.aspx"
		@ie.maximize
		@ie.bring_to_front
	end
	
	def open (page, *parameter)
		open_method = method("open_#{page}")
		page = parameter.length == 0? open_method.call : open_method.call(parameter)
		page.app(self) if page.respond_to? "app"
		page
	end
	
	def login user
		safe {footer_frame.link(:id, 'login').click}
		login_page = open :login
		login_page.login(user["Login Name"], user["Password"])
	end
	
	def logout
		footer_frame.link(:id, 'login').click
	end
	
	def need_to_choose_a_site?
		Watir::IE.find(:title, /Choose a Site/)
	end
	
	def open_sub_system sub_system
	  footer_frame.wait
		footer_frame.link(:id, sub_system.to_s).click
		
		#Watir::Wait.until do
			#begin
				#if @app.need_to_choose_a_site? then
					#site_choose_page = @app.open :site_choose
					#site_choose_page.choose :London
				#end
			#rescue
			#end
		#end
		
		navigation_frame.wait
		content_frame.wait
	end
	
	def navigate_to_function (module_index, function_index)
		navigation_frame.wait
		navigation_frame.table(:id, "lb_Group_#{module_index}_header").click
		navigation_frame.div(:id, 'NavContainer').div(:id, "lb_#{module_index}_Item_#{function_index}").fire_event('onmousedown')
		content_frame.wait
	end
	
	def navigation_frame
		@ie.frame(:name, "#{@app}main").frame(:name, "#{@app}contents")
	end
	
	def content_frame
		@ie.frame(:name, "#{@app}main").frame(:name, "#{@app}content")
	end
	
	def footer_frame
		@ie.frame(:name, "#{@app}footer")
	end
end