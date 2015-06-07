class Family
  attr_reader :members

  def initialize
    @members = []
  end

  def add_member(person)
    @members << person
  end
end