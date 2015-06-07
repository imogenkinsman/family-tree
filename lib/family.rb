require 'member'

class Family
  attr_reader :members

  def initialize
    @members = []
  end

  def add_member(name, parent_name: nil)
    parent = get_member_by_name(parent_name)
    new_member = Member.new(name, parent)
    @members << new_member
    parent.children << new_member if parent
  end

  def grandparent_of(name)
    get_member_by_name(name).grandparent.name
  end

  def only_children
    children = @members.select{ |member| !member.parent || member.parent.children.length == 1 }
    children.map(&:name).join(', ')
  end

  private

  def get_member_by_name(name)
    @members.find{ |member| member.name == name }
  end
end