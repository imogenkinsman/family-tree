class Member
  attr_accessor :name, :parent, :children

  def initialize(name, parent)
    @name = name
    @parent = parent
    @children = []
  end

  def grandparent
    @parent.parent
  end

end