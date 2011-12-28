require 'spec_helper'

describe SocialHamster::BaseProfile do

  before :each do
    @raw = {
      :first_name => 'John',
      :last_name => 'Porter',
      :email => "john@porter.mail"
    }
  end

  subject do
    SocialHamster::BaseProfile.new(@raw)
  end

  it "can be created with a hash" do
    subject.should_not be_nil
  end

  it "can be created with an object" do
    require 'ostruct'
    @raw = OpenStruct.new(@raw)
    subject.should_not be_nil
  end

  it "returns nil if no key was in raw data for specified method" do
    subject.link.should be_nil
  end

  it "handles string keys as well" do
    @raw['picture_url'] = "url.jpg"
    subject.picture_url.should == "url.jpg"
  end


end
