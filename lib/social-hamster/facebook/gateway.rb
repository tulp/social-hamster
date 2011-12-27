require 'koala'

module SocialHamster
  module Facebook
    class Gateway < SocialHamster::BaseGateway

      def initialize(opts)
        @opts = ::Hashie::Mash.new(opts)
        if access_token.nil? || access_token.empty?
          raise "Cant connect to Facebook without access_token. Options: #{opts.inspect}"
        end
      end

      def get_friends
        friends_info = []
        friends = api.get_connections('me', 'friends')
        friends.each_slice(50) do |portion|
          part_result = api.batch do |batch_api|
            portion.each do |obj|
              batch_api.get_objects(obj['id'])
            end
          end
          part_result.each do |h|
            friends_info.push(h.values.first)
          end
        end

        return friends_info.map{|f| Profile.new(f)}

      rescue Koala::Facebook::APIError, RuntimeError => e
        raise Error.new "#{e.class}: #{e.message}"
      end

      private

      def access_token
        @opts.token
      end

      def api
        @api ||= Koala::Facebook::API.new(access_token)
      end

    end
  end
end
