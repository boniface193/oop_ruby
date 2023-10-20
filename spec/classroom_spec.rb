require 'rspec'
require_relative '../classroom'

describe Classroom do
  let(:classroom) { Classroom.new("Room A") }

  describe '#Initialize' do
    it 'should create a new classroom' do
      expect(classroom.label).to eq('Room A')
    end

    it 'sets the classroom for the student' do
      classroom = Classroom.new('Room B')
      student = double("Student", classroom: nil, :classroom==> nil)

      classroom.add_student(student)

      expect(classroom.students).to include(student)
      expect(student).to have_received(:classroom=).with(classroom).once
    end
  end
end