class Member
  attr_accessor :name, :parent, :children

  def initialize(name, parent = nil)
    @name = name
    @parent = parent
    @children = []
  end

  def grandparent
    !parent || !(parent.parent) ? nil : parent.parent
  end

end