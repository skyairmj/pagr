class LoginPage < Page
	text_field :username, :id, 'Login1_UserName'
	text_field :password, :id, 'Login1_Password'
	checkbox :remember_me, :id, 'Login1_RememberMe'
	button :login_button, :id, 'Login1_LoginButton'
	
	def login (_username, _password)
		username.set _username
		password.set _password
		remember_me.clear
		login_button.click
	end
end