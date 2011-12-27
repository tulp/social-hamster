require "social-hamster/version"
require "hashie"

module SocialHamster

  autoload :BaseProfile, 'social-hamster/base_profile'
  autoload :BaseGateway, 'social-hamster/base_gateway'
  autoload :Error, 'social-hamster/error'

  module Facebook
    autoload :Profile, 'social-hamster/facebook/profile'
    autoload :Gateway, 'social-hamster/facebook/gateway'
  end

  def self.connect(provider, credentials)
    constant_name = provider.to_s.gsub(/^(.)/){ $1.upcase }
    const_get(constant_name).const_get("Gateway").new(credentials)
  end


end
