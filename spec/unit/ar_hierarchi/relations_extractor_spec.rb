require 'spec_helper'

RSpec.describe ARHierarchi::RelationsExtractor do

  it "extract all relations" do
    relations = described_class.new.extract_relations User

    expect(relations).to eq([["address", "has_one", {:class_name=>"User::Address"}],
       ["car", "has_one", {:class_name=>"User::Address"}],
       ["mobile_phones", "has_many", {:class_name=>"User::MobilePhone"}],
       ["commissions", "has_many", {}]])
  end

  it "extract has_many through relation" do
    relation = described_class.new.process_reflection Advertiser.reflections["users"]
    expect(relation).to eq(["has_many", {:through=>:user_comissions}])
  end

  it "extract reflection type" do
    type = described_class.new.extract_reflection_type User.reflections["address"]
    expect(type).to eq("has_one")
  end
end