# Social Hamster

This gem has been created to abstract and unify iteractions with social networks.

[![Build Status](https://secure.travis-ci.org/gumayunov/social-hamster.png)](http://travis-ci.org/gumayunov/social-hamster)

## Basic Usage
```ruby
    # app/services/social_service.rb

    class SocialService

      def self.get_friends(user_id, provider)

        auth = User.find(user_id).authentications.find_by_provider(provider)
        if auth.blank? || auth.credentials.blank?
          raise NoCredentialsError.new("user: #{user_id}")
        end

        connection = SocialHamster.connect(provider, auth.credentials)
        return connection.get_friends

      rescue SocialHamster::Error => e
        raise Error.new("#{e.class}: #{e.message}")
      end

    end

    # app/controllers/social_friendlists_controller.rb

    def show
      frineds = SocialService.get_friends(user_id, params[:provider])
    rescue SocialService::NoCredentialsError
      redirect_to auth_path(prams[:provider]) #to omniauth's /auth/facebook/
    rescue SocialService::Error
      flash[:error] = "Cant access #{params[:provider].capitalize}. Try again later"
      redirect_to social_friendlists_path
    end
```


## TODO


* Twitter
* Vkontakte
* Mailru
* Wall/status posting (FB, twitter, vkontakte)
* Direct messages (mailru, twitter)
* Extract networks into gems

## License

Copyright (c) 2011 by Victor Gumayunov

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

