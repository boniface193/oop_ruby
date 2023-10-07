require_relative 'library'

class ConsoleApp

  def initialize
    @library = Library.new
  end

  def all_books
    puts "List of Books:"
    @library.books.each { |book| puts "#{book.title} by #{book.author}" }
  end

  def all_people
    puts "List of People:"
    @library.people.each { |person| puts person.name }
  end

  def add_person
    print "Enter person's name: "
    name = gets.chomp
    person = @library.create_person(name)
    puts "Created person: #{person.name}"
  end

  def add_book
    print "Enter book title: "
    title = gets.chomp
    print "Enter book author: "
    author = gets.chomp
    book = @library.create_book(title, author)
    puts "Created book: #{book.title} by #{book.author}"
  end

  def add_rental
    print "Enter rental date (YYYY-MM-DD): "
    date = gets.chomp
    print "Enter person's name: "
    person_name = gets.chomp
    print "Enter book title: "
    book_title = gets.chomp

    person = @library.people.find { |p| p.name == person_name }
    book = @library.books.find { |b| b.title == book_title }

    if person && book
      rental = @library.create_rental(date, book, person)
      puts "Created rental: #{rental.date} - #{book.title} by #{person.name}"
    else
      puts "Person or book not found."
    end
  end

  def list_rentals_for_person
    print "Enter person's name: "
    person_name = gets.chomp

    person = @library.people.find { |p| p.name == person_name }

    if person
      puts "Rentals for #{person.name}:"
      rentals = @library.rentals.select { |r| r.person == person }
      rentals.each { |rental| puts "#{rental.date} - #{rental.book.title}" }
    else
      puts "Person not found."
    end
  end
end