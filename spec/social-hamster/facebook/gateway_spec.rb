require 'spec_helper'

describe SocialHamster::Facebook::Gateway do

  before :each do
    @opts = {:token => 'abc'}
  end

  subject do
    SocialHamster::Facebook::Gateway.new @opts
  end

  describe "constructor" do

    it "can be created with non empty :access_token option" do
      subject.should_not be_nil
    end

    context "when token is invalid" do
      it "raises exception on empty token" do
        @opts = {}
        lambda{ subject }.should raise_error
      end
    end

  end

  describe "#get_friends" do

    context "koala returns wellformed results" do

    end

    context "koala raises exception" do
      before :each do
        Koala::Facebook::API.any_instance.stub(:get_connections).and_raise("test error")
      end

      it "wraps exception into SocialHamster::Error" do
        lambda { subject.get_friends }.should raise_error(SocialHamster::Error)
      end

      it "composes error message and class from initial error" do
        begin
          subject.get_friends
        rescue SocialHamster::Error => e
          e.message.should == "RuntimeError: test error"
        end
      end

    end

  end

end
