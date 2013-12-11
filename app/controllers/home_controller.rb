class HomeController < ApplicationController
  def index
  end

  # POST
  def follow

	@client = Client.new(:email => client_params[:email])
  	respond_to do |format|
  		if @client.save
  			format.html { redirect_to root_path, notice: "Please confirm your email"}
  			format.json {}
  			format.js
  		else
  			@client = nil
  			format.html {redirect_to root_path, alert: "Not working"}
  			format.json{}
  			format.js
  		end
  	end
  	
  end

  # GET
  def confirm
    @client = Client.find_by_email(client_params[:email])

    respond_to do |format|
      if @client.confirmation_token == client_params[:confirmation_token]
        @client.confirmed = true
        @client.save
        format.html {redirect_to root_path, notice: "Thank you for confirming your account with"}
      else
        format.html {redirect_to root_path, notice: "No confirmation done"}
      end
    end
  end


 private
 	def client_params
 		params.permit(:email, :confirmation_token, :authenticity_token)
 	end
end
