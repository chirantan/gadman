require 'spec_helper'

describe Gadget, :type => :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :user_id }
  it { should belong_to :user }

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

    it "should find iphone and ipad for 'IP'"
    it "should find ipad and thinkpad for 'pad'"
    it "should not find anything when searched for 'neo' "

  end
end
