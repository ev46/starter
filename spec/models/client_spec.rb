require 'spec_helper'

describe Client do
	let(:client) { FactoryGirl.create(:client) }
  	
  	describe "new client is added" do 
  		it "passes if token not nil" do
  			client.confirmation_token.should_not be nil
  		end

  		it "fails if confirmed is true" do
  			client.confirmed?.should_not be true
  		end
  	end
end
