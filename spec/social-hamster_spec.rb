require 'spec_helper'

describe SocialHamster do

  describe ".connect" do

    before :all do
      module SocialHamster
        module Hypernet
          class Gateway
            def initialize(credentials)
            end
          end
        end
      end
      @gateway_class = SocialHamster::Hypernet::Gateway
    end

    it "instatize gateway according to provider" do
      connection = SocialHamster.connect(:hypernet, {})
      connection.class.should == @gateway_class
    end

    it "passes credentials into gateway constructor" do
      credentials = {:a => 1}
      @gateway_class.should_receive(:new).with(credentials)
      SocialHamster.connect(:hypernet, credentials)
    end

  end

end
