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

  end

end