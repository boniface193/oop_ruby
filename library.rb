require_relative 'person'

class Library
  attr_reader :books, :rental, :people

  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def create_book(title, author)
    book = Book.new(title, author)
    books << book
    book
  end

  def create_person(name)
    person = Person.new(name)
    people << person
    person
  end

  def create_rental(date, book, person)
    rental = Rental.new(date, book, person)
    rentals << rental
    rental
  end
end
