require 'rspec'
require_relative '../book'

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
