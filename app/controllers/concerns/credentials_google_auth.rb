require 'socket'

class CredentialsGoogleAuth

	def self.client_id
		if get_domain.include? "-stage"
			ENV["G_OAUTH_STAGE_CLIENT_ID"]
		else
			ENV["G_OAUTH_CLIENT_ID"]
		end
	end

	def self.client_secret
		if get_domain.include? "-stage"
			ENV["G_OAUTH_STAGE_CLIENT_SECRET"]
		else
			ENV["G_OAUTH_CLIENT_SECRET"]
		end
	end

	def self.get_domain
		hostname = Socket.gethostname
		Rails.logger.debug "hostname: #{hostname}"
		hostname
	end
end
