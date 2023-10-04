require_relative 'nameable'

class Decorator < Namebale
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name()
    @nameable.correct_name
  end
end
