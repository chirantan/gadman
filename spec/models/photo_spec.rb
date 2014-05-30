require 'spec_helper'

describe Photo, :type => :model do
  it { should belong_to :gadget}
end
