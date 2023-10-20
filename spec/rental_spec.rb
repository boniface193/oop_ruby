require 'rspec'
require_relative '../book'
require_relative '../rentals'
require_relative '../person'

describe Rental do
  let(:rental_date) { '2023-10-20' }
  let(:book) { double('Test Book', add_rentals: nil, rentals: []) }
  let(:person) { double('Person', add_rentals: nil, rentals: []) }

  describe '#initialize' do
    it 'creates a new rental with the given date, book, and person' do
      rental = Rental.new(rental_date, book, person)
      expect(rental.date).to eq(rental_date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end

    it 'adds the rental to the person' do
      # Ensure that the person double is correctly set up to handle the rentals array
      allow(person).to receive(:rentals).and_return([])

      rental = Rental.new(rental_date, book, person)
      expect(person.rentals).to include(rental)
    end
  end
end
