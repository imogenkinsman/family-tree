require_relative '../lib/family'

describe "Family" do

  before(:each) do
    @family = Family.new
  end

  describe "#add_member" do

    it "adds a new family member" do
      @family.add_member("Nancy")
      expect(@family.members.length).to eq(1)
    end

    it "can add a new family member and maintain a reference to their parent" do
      @family.add_member("Nancy")
      @family.add_member("Jill", parent_name: "Nancy")
      expect(@family.members[1].parent.name).to eq("Nancy")
    end

  end

  describe "#grandparent_of" do

    it "returns the grandparent of a family member" do
      @family.add_member("Nancy")
      @family.add_member("Jill", parent_name: "Nancy")
      @family.add_member("Kevin", parent_name: "Jill")
      expect(@family.grandparent_of("Kevin")).to eq("Nancy")
    end

  end

  describe "#only_children" do

    it "returns the names of members who have no siblings" do
      @family.add_member("Nancy")
      @family.add_member("Jill", parent_name: "Nancy")
      @family.add_member("Carl", parent_name: "Nancy")
      @family.add_member("Catherine", parent_name: "Carl")

      only_child_names = @family.only_children.split(", ")
      expect(only_child_names).to include("Nancy")
      expect(only_child_names).to include("Catherine")
      expect(only_child_names.length).to eq(2)
    end

  end

  describe "#no_children" do

    it "returns the names of childless members" do
      @family.add_member("Nancy")
      @family.add_member("Jill", parent_name: "Nancy")
      @family.add_member("Adam", parent_name: "Nancy")
      @family.add_member("Kevin", parent_name: "Jill")

      childless_names = @family.no_children.split(", ")
      expect(childless_names).to include("Adam")
      expect(childless_names).to include("Kevin")
      expect(childless_names.length).to eq(2)
    end

  end

end