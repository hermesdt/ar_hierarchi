require 'spec_helper'

RSpec.describe ARHierarchi::RelationsExtractor do

  it "extract all relations" do
    relations = described_class.new.extract_relations ARHierarchi::User

    expect(relations).to eq(
      [{:type=>"has_one", :name=>"address", :options=>{:class_name=>"User::Address"}, klass: ARHierarchi::User::Address},
      {:type=>"has_many", :name=>"mobile_phones", :options=>{:class_name=>"User::MobilePhone"}, klass: ARHierarchi::User::MobilePhone},
      {:type=>"has_many", :name=>"user_comissions", :options=>{class_name: "UserCommission"}, klass:  ARHierarchi::UserCommission}])
  end

  it "extract has_many through relation" do
    relation = described_class.new.reflection_type ARHierarchi::Advertiser.reflections["users"]
    expect(relation).to eq("has_many")
  end

  it "extract reflection type" do
    type = described_class.new.extract_reflection_type ARHierarchi::User.reflections["address"]
    expect(type).to eq("has_one")
  end
end
