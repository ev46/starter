class ClientMailer < ActionMailer::Base
	default :from => 'confirm@activemenu.org'

	def send_confirmation(client)
		@client = client
		mail(:to => @client.email, :subject => 'Please confirm your email with activemenu.org')
	end
end