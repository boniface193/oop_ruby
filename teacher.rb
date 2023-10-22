require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, name = 'unknown', parent_permission: true, specialization: 'unknown')
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true # Teachers can always use services
  end
end
