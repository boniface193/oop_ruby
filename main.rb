require_relative 'app'

class Main
  def initialize
    @console = ConsoleApp.new
  end

  def main
    puts '\nLibrary Menu:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List rentals for a person'
    puts '7. Quit'
  end

  def handle_menu_option(choice)
    case choice
    when 1
      @console.all_books
    when 2
      @console.all_people
    when 3
      @console.add_person
    when 4
      @console.add_book
    when 5
      @console.add_rental
    when 6
      @console.list_rentals_for_person
    when 7
      quit
    else
      invalid_option
    end
  end

  def quit
    puts 'Goodbye!'
  end

  def invalid_option
    puts 'Invalid option. Please try again.'
  end

  def run
    loop do
      main
      print 'Select an option: '
      choice = gets.chomp.to_i

      handle_menu_option(choice)

      break if choice == 7
    end
  end
end

main
