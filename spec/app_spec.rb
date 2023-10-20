require 'rspec'
require_relative '../app.rb'
describe ConsoleApp do
  let(:app) { ConsoleApp.new }
  describe "#all_books" do
    it "should print all book titles and authors" do
      book = Book.new("Book 1", "Author 1")
      app.books << book
      expect { app.all_books }.to output(/Title: "Book 1", Author: Author 1/).to_stdout
    end
  end
  describe "#all_people" do
    it "should print all people (students and teachers)" do
      student = Student.new(20, "Student 1", parent_permission: true)
      teacher = Teacher.new(30, "Teacher 1", specialization: "Math")
      app.people << student
      app.people << teacher
      expect { app.all_people }.to output(/Name: Student 1, ID: \d+, Age: 20/).to_stdout
      expect { app.all_people }.to output(/Name: Teacher 1, ID: \d+, Age: 30/).to_stdout
    end
  end
  describe "#student_teacher" do
    it "should add a student" do
      allow(app).to receive(:gets).and_return("1", "20", "Student 1", "Y")
      expect { app.student_teacher }.to output(/Person created successfully/).to_stdout
    end
    it "should add a teacher" do
      allow(app).to receive(:gets).and_return("2", "30", "Teacher 1", "Math")
      expect { app.student_teacher }.to output(/Person created successfully/).to_stdout
    end
  end
  # Add tests for the remaining methods in a similar manner
  describe "#add_book" do
    it "should add a book" do
      allow(app).to receive(:gets).and_return("Book 1", "Author 1")
      expect { app.add_book }.to output(/Book created successfully/).to_stdout
    end
  end
end