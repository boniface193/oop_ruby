require_relative 'person'

class Student < Person
  def initialize(classroom, name = 'unknown', age = 18)
    super(name, age)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
