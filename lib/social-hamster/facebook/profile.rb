module SocialHamster
  module Facebook
    class Profile < BaseProfile

      def convert(raw)
        {
          :uid => raw.id,
          :first_name => raw.first_name,
          :last_name => raw.last_name,
          :name => [raw.first_name, raw.last_name].join(' '),
          :gender => raw.gender,
          :picture => raw.picture || "http://graph.facebook.com/#{raw.id}/picture",
          :link => raw.link
        }
      end

    end
  end
end
