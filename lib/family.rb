require 'member'

class Family
  attr_reader :members

  @@memberClass = Member

  def initialize
    @members = []
  end

  def add_member(name, parent_name: nil)
    parent = get_member_by_name(parent_name)
    @members << @@memberClass.new(name, parent)
  end

  def grandparent_of(name)
    get_member_by_name(name).grandparent.name
  end

  private

  def get_member_by_name(name)
    @members.find{ |member| member.name == name }
  end
end