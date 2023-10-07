require_relative 'app'

class Main
  def initialize
    @console = ConsoleApp.new
  end

  def all_books
    @console.all_books
  end

  def all_people
    @console.all_people
  end

  def add_person
    @console.add_person
  end

  def add_book
    @console.add_book
  end

  def add_rental
    @console.add_rental
  end

  def list_rentals_for_person
    @console.list_rentals_for_person
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
    menu_options = {
      1 => :all_books,
      2 => :all_people,
      3 => :add_person,
      4 => :add_book,
      5 => :add_rental,
      6 => :list_rentals_for_person,
      7 => :quit
    }

    action = menu_options[choice]
    send(action) if action
    invalid_option unless action
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

deploy = Main.new
deploy.run
