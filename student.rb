require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'unknown', parent_permission: true, classroom: 'unknown')
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classrooms=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
