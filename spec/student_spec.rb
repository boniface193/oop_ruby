require 'rspec'
require_relative '../student'
require_relative '../classroom'

describe Student do
  let(:student) { Student.new(16, 'Alice', parent_permission: true, classroom: 'Math') }

  context 'attributes' do
    it 'has an age' do
      expect(student.age).to eq(16)
    end

    it 'has a name' do
      expect(student.name).to eq('Alice')
    end

    it 'has parent permission' do
      expect(student.can_use_services?).to be true
    end

    it 'has a classroom' do
      expect(student.classroom).to eq('Math')
    end
  end

  context 'play_hooky' do
    it 'returns a shrug emoticon' do
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end

  describe '#classrooms=' do
    it 'should not add the student to the classroom if already assigned' do
      student = Student.new('John', 18)  # Provide required arguments for initialization
      classroom = Classroom.new('Math Class')

      student.classrooms = classroom
      initial_students_count = classroom.students.count

      # Assign the same classroom again
      student.classrooms = classroom

      expect(classroom.students.count).to eq(initial_students_count)
    end
  end
end
