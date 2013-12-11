class Client < ActiveRecord::Base

	before_create :make_token
	validates :email, :uniqueness => {:message => 'Already following'}

	def token_match?(token)
		self.confirmation_token == token
	end

	private
	def make_token
		self.confirmation_token = Digest::SHA1.hexdigest([Time.now, rand].join)
	end

end
