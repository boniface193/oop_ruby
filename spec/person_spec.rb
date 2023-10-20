require 'rspec'
require_relative '../person'  # Make sure to require the Person class

describe Person do
  let(:person) { Person.new(20, "John", parent_permission: true) }
  let(:book) { double("Book") }  # You can use a double for the Book object

  describe '#initiliaze' do
    it 'to create a new person' do
      expect(person.age).to eq(20)
      expect(person.name).to eq('John')
    end
  end

  describe '#add_rentals' do
    it 'initialize an empty rental array' do
      expect(person.rentals).to be_empty
    end
  end

  describe '#correct_name' do
    it 'return the correct name' do
      expect(person.correct_name()).to eq('John')
    end
  end

  describe '#can_use_services?' do
    context 'when the person is of age' do
      it 'returns true' do
        expect(person.can_use_services?).to be(true)
      end
    end

  end
end