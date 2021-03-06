require 'spec_helper'

describe Gadget, :type => :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :user_id }
  it { should belong_to :user }
  it { should have_many :photos }

  describe ".search" do

    let(:user) { create(:user) }

    before do
      @cell_phone = user.gadgets.create :name => "Cell phone"
      @iphone     = user.gadgets.create :name => "iPhone"
      @ipad       = user.gadgets.create :name => "iPad"
      @macbook    = user.gadgets.create :name => "Macbook"
      @thinkpad   = user.gadgets.create :name => "Thinkpad"
    end

    it "should find cell_phone and iphone whensearch for 'phone'" do
      results = Gadget.search("phone")
      expect(results).to include @cell_phone
      expect(results).to include @iphone
    end

    it "should find iphone and ipad for 'IP'" do
      results = Gadget.search("IP")
      expect(results).to include @iphone
      expect(results).to include @ipad
    end

    it "should find ipad and thinkpad for 'pad'" do
      results = Gadget.search("pad")
      expect(results).to include @ipad
      expect(results).to include @thinkpad
    end

    it "should not find anything when searched for 'neo'" do
      results = Gadget.search("neo")
      expect(results).to be_empty
    end

    it "should show no results if there search query is blank" do
      results = Gadget.search("")
      expect(results).to be_empty
    end

  end
end
