module AuthHelper
	require 'signet/oauth_2/client'

	# App's client ID. Register the app in Application Registration Portal to get this value.
	CLIENT_ID = "f850d0d9-4fe3-4c43-a104-4786e3721e3e"
	# App's client secret. Register the app in Application Registration Portal to get this value.
	CLIENT_SECRET = "fV2vvxsfRugsXDrWComoh4J"

	# REDIRECT_URI = 'http://localhost:3000/authorize' # Temporary!
	
	# Scopes required by the app
	SCOPES = [ 'openid',
	           'https://outlook.office.com/contacts.read' ]

	# Generates the login URL for the app.

	def google_login

		client = Signet::OAuth2::Client.new(
		  :authorization_uri => 'https://accounts.google.com/o/oauth2/auth',
		  :token_credential_uri =>  'https://www.googleapis.com/oauth2/v3/token',
		  :client_id => '832245431959-4qt4jj9euf22pd3d6tdsqknrdd32nuem.apps.googleusercontent.com',
		  :client_secret => 'qgYA7byhHjubHF4gkc7movGm',
		  :scope => 'https://www.google.com/m8/feeds',
		  # :redirect_uri => 'http://invtr-staging.herokuapp.com/google_authorize'
		  :redirect_uri => 'http://localhost:8000/google_authorize'
		)
		google_logins = client.authorization_uri
	end
	def login_url
	  client = OAuth2::Client.new(CLIENT_ID,
	                              CLIENT_SECRET,
	                              :site => 'https://login.microsoftonline.com',
	                              :authorize_url => '/common/oauth2/v2.0/authorize',
	                              :token_url => '/common/oauth2/v2.0/token')
	                              
	  login_url = client.auth_code.authorize_url(:redirect_uri => authorize_url, :scope => SCOPES.join(' '))
	end

	def session_url
	  client = OAuth2::Client.new(CLIENT_ID,
	                              CLIENT_SECRET,
	                              :site => 'https://login.microsoftonline.com',
	                              :authorize_url => '/common/oauth2/v2.0/authorize',
	                              :token_url => '/common/oauth2/v2.0/token')
	                              
	  login_url = client.auth_code.authorize_url(:redirect_uri => authorize_url + "_session", :scope => SCOPES.join(' '))
	end

	def get_token_from_code(auth_code)
	  client = OAuth2::Client.new(CLIENT_ID,
	                              CLIENT_SECRET,
	                              :site => 'https://login.microsoftonline.com',
	                              :authorize_url => '/common/oauth2/v2.0/authorize',
	                              :token_url => '/common/oauth2/v2.0/token')

	  token = client.auth_code.get_token(auth_code,
	                                     :redirect_uri => authorize_url,
	                                     :scope => SCOPES.join(' '))
	end

	def get_token_from_session_code(auth_code)
	  client = OAuth2::Client.new(CLIENT_ID,
	                              CLIENT_SECRET,
	                              :site => 'https://login.microsoftonline.com',
	                              :authorize_url => '/common/oauth2/v2.0/authorize',
	                              :token_url => '/common/oauth2/v2.0/token')

	  token = client.auth_code.get_token(auth_code,
	                                     :redirect_uri => authorize_url + "_session",
	                                     :scope => SCOPES.join(' '))
	end

	def get_email_from_id_token(id_token)
	  
	  # JWT is in three parts, separated by a '.'
	  token_parts = id_token.split('.')
	  # Token content is in the second part
	  encoded_token = token_parts[1]
	  
	  # It's base64, but may not be padded
	  # Fix padding so Base64 module can decode
	  leftovers = token_parts[1].length.modulo(4)
	  if leftovers == 2
	    encoded_token += '=='
	  elsif leftovers == 3
	    encoded_token += '='
	  end
	  
	  # Base64 decode (urlsafe version)
	  decoded_token = Base64.urlsafe_decode64(encoded_token)
	  
	  # Load into a JSON object
	  jwt = JSON.parse(decoded_token)
	  
	  # Email is in the 'preferred_username' field
	  email = jwt['preferred_username']
	end
end
