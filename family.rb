class Family
  attr_reader :members

  @@memberClass = Struct.new("Member", :name, :parent)

  def initialize
    @members = []
  end

  def add_member(name, parent_name: nil)
    parent = @members.find{ |member| member.name == parent_name}
    @members << @@memberClass.new(name, parent)
  end
end