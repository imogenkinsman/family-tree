require_relative '../lib/member'

describe "Member" do

  describe "#grandparent" do

    it "returns its grandparent if it has one" do
      member = Member.new("Nancy")
      child = Member.new("Jill", member)
      grandchild = Member.new("Kevin", child)
      expect(grandchild.grandparent).to eq(member)
    end

    it "returns nil if it has no grandparent" do
      member = Member.new("Nancy")
      child = Member.new("Jill", member)
      expect(member.grandparent).to be_nil
      expect(child.grandparent).to be_nil
    end

  end

end