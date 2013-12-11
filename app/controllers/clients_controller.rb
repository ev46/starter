class ClientsController < ApplicationController
	before_filter :authenticate_admin!

	def index
		@clients = Client.all
	end

end