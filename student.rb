require_relative 'person'

class Student < Person
  def initialize(name = "unknown", age = 18, classroom)
    super(name, age)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

end