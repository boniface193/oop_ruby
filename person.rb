require_relative 'nameable'
require_relative 'decorator'

class Person < Namebale
  attr_reader :id, :name, :age, :rentals

  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rentals(date, person)
    Rental.new(date, self, person)
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name()
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

class CapitalizeDecorator < Decorator
  def correct_name()
    super.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name()
    super[0, 10]
  end
end

class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students << student
    # Set the classroom for the student
    student.classroom = self
  end
end

class Student
  attr_accessor :name, :classroom

  def initialize(name)
    @name = name
    @classroom = nil
  end

  def classrooms=(classroom)
    @classroom&.students&.delete(self)
    @classroom = classroom
    classroom.students << self
  end
end

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end
end

class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    book.rentals << self
    person.rentals << self
  end
end

person = Person.new(22, 'maximilianus')
puts person.correct_name

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
