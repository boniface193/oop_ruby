require 'rspec'
require_relative '../person' # Make sure to require the Person class

describe Person do
  let(:person) { Person.new(20, 'John', parent_permission: true) }
  let(:book) { double('Book') } # You can use a double for the Book object

  describe '#initiliaze' do
    it 'to create a new person' do
      expect(person.age).to eq(20)
      expect(person.name).to eq('John')
    end
  end

  describe '#create_persons' do
    it 'should set the name attribute' do
      new_name = 'John'
      person.create_persons(new_name)
      expect(person.instance_variable_get(:@name)).to eq(new_name)
    end
  end

  describe 'private #of_age?' do
    let(:aage) { Person.new(17, 'John', parent_permission: true) }

    it 'should return false if the person is under 18' do
      result = aage.send(:of_age?)
      expect(result).to be(false)
    end
  end

  describe '#add_rentals' do
    it 'initialize an empty rental array' do
      expect(person.rentals).to be_empty
    end
  end

  describe '#correct_name' do
    it 'return the correct name' do
      expect(person.correct_name).to eq('John')
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
