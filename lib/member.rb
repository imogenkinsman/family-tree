class Member
  attr_accessor :name, :parent

  def initialize(name, parent)
    @name = name
    @parent = parent
  end

  def grandparent
    @parent.parent
  end

end