require 'spec_helper'

describe SocialHamster::Facebook::Profile do

  before :each do
    @fb_user = YAML.load_file('./spec/fixtures/facebook-friends.yml').first
  end

  subject do
    SocialHamster::Facebook::Profile.new @fb_user
  end

  it "can be created from koala lib get_object response hash" do
    subject.should_not be_nil
  end

  %w{uid name first_name last_name gender link picture}.each do |field|
    it "provides ##{field}" do
      subject.send(field).should_not be_nil
    end
  end

  describe "#name" do

    it "is composed from first_name and last_name" do
      @fb_user[:first_name] = "11"
      @fb_user[:last_name] = "22"
      subject.name.should == "11 22"
    end

  end

  describe "#picture" do

    it "composes picture value from id" do
      url = "http://graph.facebook.com/100045296377/picture"
      subject.picture.should == url
    end

  end


end
