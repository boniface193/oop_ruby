require 'rspec'
require_relative '../book'
require_relative '../app'

describe Book do
  let(:book) { Book.new('Test Book', 'Test Author') }

  describe '#initialize' do
    it 'should create a new book with the given title and author' do
      expect(book.title).to eq('Test Book')
      expect(book.author).to eq('Test Author')
    end

    it 'initialize an empty rental array' do
      expect(book.rentals).to be_empty
    end
  end
end

describe Book do
  let(:book) { Book.new('Book 1', 'Author 1') }
  let(:person) { Student.new(1, 'Student 1', parent_permission: true) }

  describe '#add_rentals' do
    it 'should add a rental to the book' do
      date = '2022-09-15'
      rental = book.add_rentals(date, person)
      expect(rental).to be_an_instance_of(Rental)
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(book.rentals).to include(rental)
    end
  end
end
