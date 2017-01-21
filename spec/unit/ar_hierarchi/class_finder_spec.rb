require 'spec_helper'

RSpec.describe ARHierarchi::ClassFinder do
  before(:all) do
    ARHierarchi.configure do |config|
      config.extra_conditions = lambda do |klass|
        klass.ancestors.include?(ActiveRecord::Base)
      end
    end
  end

  it "finds all classes" do
    descendants = described_class.new.get_descendants_of ActiveRecord::Base
    expect(descendants.map(&:name).sort).to eq(
        ["User", "User::MobilePhone", "Advertiser",
          "UserCommission", "AbstractActiveRecord", "User::Address"].sort
      )
  end
end