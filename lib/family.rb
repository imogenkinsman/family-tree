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

  def no_children
    @members.select{ |member| member.children.empty? }.map(&:name).join(', ')
  end

  def most_grandchildren
    grandchild_counts = Hash.new(0)
    @members.each do |member|
      grandchild_counts[grandparent_of(member.name)] += 1 if member.has_grandparent?
    end
    grandchild_counts.max_by{ |_, count| count }.first
  end

  private

  def get_member_by_name(name)
    @members.find{ |member| member.name == name }
  end
end