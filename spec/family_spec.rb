require_relative('../family')

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

    end

  end

end