require 'spec_helper'

describe SocialHamster do

  describe ".connect" do

    before :all do
      module SocialHamster
        class Hypernet
          def initialize(credentials)
          end
        end
      end
    end

    it "instatize gateway according to provider" do
      connection = SocialHamster.connect(:hypernet, {})
      connection.class.should == SocialHamster::Hypernet
    end

    it "passes credentials into gateway constructor" do
      credentials = {:a => 1}
      SocialHamster::Hypernet.should_receive(:new).with(credentials)
      SocialHamster.connect(:hypernet, credentials)
    end

  end

end
