require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rentals'

class ConsoleApp
  attr_reader :books, :rentals, :people

  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def all_books
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def all_people
    @people.each do |person|
      if person.is_a?(Student)
        puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def student_teacher
    print 'Do you want to create a student (1)  or a teacher (2): '
    person_type = gets.chomp.to_i

    print 'Age? '
    age = gets.chomp.to_i

    print 'Name? '
    name = gets.chomp

    if person_type.to_i == 2
      print 'Specialization? '
      specialization = gets.chomp
      @people << Teacher.new(age, name, specialization: specialization) unless specialization.length < 2
    else
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.downcase == 'y'
      @people << Student.new(age, name, parent_permission: parent_permission)
    end

    puts 'Person created successfully'
  end

  def add_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)

    puts "\nBook created successfully"
  end

  def add_rental
    puts 'Select a book from the following list by number:'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_index = gets.chomp.to_i

    puts "\nSelect a person from the following list by number (not id):"

    @people.each_with_index do |person, index|
      if person.is_a?(Student)
        puts "#{index}) [Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "#{index}) [Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    person_index = gets.chomp.to_i

    print "\nDate: "
    date = gets.chomp

    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
  end

  def list_rentals_for_person
    print 'ID of person: '
    person_id = gets.chomp.to_i

    puts 'Rentals:'
    @rentals.each do |rental|
      if rental.person.id == person_id
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end
end
