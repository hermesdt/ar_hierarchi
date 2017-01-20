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
    descendants = described_class.new.get_descendant_of Object
    expect(descendants.map(&:name).sort).to eq(
        ["User", "User::MobilePhone", "Advertiser", "ActiveRecord::Base",
          "UserCommission", "AbstractActiveRecord", "User::Address"].sort
      )
  end
end