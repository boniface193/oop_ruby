require 'rspec'
require_relative '../teacher'

describe Teacher do
  let(:teacher) { Teacher.new(40, 'Mr. Johnson', parent_permission: true, specialization: 'Science') }

  context 'attributes' do
    it 'has an age' do
      expect(teacher.age).to eq(40)
    end

    it 'has a name' do
      expect(teacher.name).to eq('Mr. Johnson')
    end

    it 'has a specialization' do
      expect(teacher.specialization).to eq('Science')
    end
  end

  context 'can_use_services?' do
    it 'returns true for teachers' do
      expect(teacher.can_use_services?).to be true
    end
  end
end
