require_relative 'person'

class Teacher
  def initialize(name = "Unknown", age = 18, specialization)
    super(name, age)
    @specialization = specialization
  end
  
  def can_use_services?
    true # Teachers can always use services
  end
end