require_relative 'person'

class Teacher
  def initialize(specialization, name = 'unknown', age = 18)
    super(name, age)
    @specialization = specialization
  end

  def can_use_services?
    true # Teachers can always use services
  end
end
