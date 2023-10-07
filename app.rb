require_relative 'library'

class ConsoleApp
  def initialize
    @library = Library.new
  end

  def all_books
    puts 'List of Books:'
    @library.books.each { |book| puts "#{book.title} by #{book.author}" }
  end

  def all_people
    puts 'List of People:'
    @library.people.select { |key| puts "#{key[:name]}"}
  end

  def add_person
    print 'Enter person\'s name: '
    name = gets.chomp
    person = @library.create_person({ name: name })
    person.name.each do |key, value|
      puts "Created person #{key} as #{value}"
    end
  end

  def add_book
    print 'Enter book title: '
    title = gets.chomp
    print 'Enter book author: '
    author = gets.chomp
    book = @library.create_book(title, author)
    puts "Created book: #{book.title} by #{book.author}"
  end

  def add_rental
    print 'Enter rental date (YYYY-MM-DD): '
    date = gets.chomp
    print 'Enter person\'s name: '
    person_name = gets.chomp
    print 'Enter book title: '
    book_title = gets.chomp

    person = @library.people.select { |key| key[:name] == person_name }

    person2 = person.find { |p| p[:name] == person_name }

    if person.nil?
      puts 'Person not found.'
      return
    end

    book = @library.books.find { |b| b.title == book_title }

    if book.nil?
      puts 'Book not found.'
      return
    end
    rental = @library.create_rental(date, book, person)
    puts "Created rental: #{rental.date} - #{book.title} by #{person2[:name]}"
  end

  def list_rentals_for_person
    print 'Enter person\'s name: '
    person_name = gets.chomp

    person = @library.people.select { |key| key[:name] == person_name }

    person2 = person.find { |p| p[:name] == person_name }

    if person2
      puts "Rentals for #{person2[:name]} is available"
    else
      puts 'Person not found.'
    end
  end
end
