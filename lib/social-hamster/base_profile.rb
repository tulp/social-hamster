require "forwardable"
require "hashie"

module SocialHamster
  class BaseProfile

    extend Forwardable

    def_delegators :@data, :name, :first_name, :last_name, :birthday, :gender
    def_delegators :@data, :uid, :email, :picture_url, :link

    def initialize(raw)
      if raw.is_a?(Hash)
        raw = Hashie::Mash.new(raw)
      end
      hash = convert(raw)
      @data = Hashie::Mash.new(hash)
    end

    def convert(raw)
      raw.to_hash
    end

  end


end
