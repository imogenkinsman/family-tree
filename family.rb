class Family
  attr_reader :members

  @@memberClass = Struct.new("Member", :name, :parent)

  def initialize
    @members = []
  end

  def add_member(person, parent: nil)
    @members << @@memberClass.new(person, parent)
  end
end