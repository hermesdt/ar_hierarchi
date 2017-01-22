require 'spec_helper'

RSpec.describe ARHierarchi::ClassFinder do

  it "finds all classes" do
    descendants = described_class.new.get_descendants_of ActiveRecord::Base
    expect(descendants.map(&:name).sort).to eq(
        ["ARHierarchi::User", "ARHierarchi::User::MobilePhone", "ARHierarchi::Advertiser",
          "ARHierarchi::UserCommission", "ARHierarchi::AbstractActiveRecord", "ARHierarchi::User::Address"].sort
      )
  end
end