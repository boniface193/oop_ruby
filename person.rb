require_relative 'nameable'
require_relative 'decorator'

class Person < Namebale
  attr_reader :id, :name, :age

  def initialize(age, name = 'unknown', parent_permission: true)
    super
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
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

person = Person.new(22, 'maximilianus')
puts person.correct_name

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
