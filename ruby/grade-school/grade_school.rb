# frozen_string_literal: true

class School
  def initialize
    @roster = []
  end

  def students(grade)
    return [] if @roster.none? { |x| x.grade == grade }

    find_students_within_a_grade(grade)
  end

  def students_by_grade
    return [] if @roster.empty?

    build_the_roster
  end

  def add(name, grade)
    @roster << Student.new(name, grade)
  end

  private

  def find_students_within_a_grade(grade)
    @roster.select do |student|
      student.grade == grade
    end.map(&:name).sort
  end

  def establish_present_grades
    @grades = @roster.uniq(&:grade).map(&:grade)
  end

  def build_the_roster
    establish_present_grades
    full_roster = []
    @grades.each do |grade|
      full_roster << { grade: grade, students: find_students_within_a_grade(grade) }
    end
    full_roster.sort_by! { |grade_roster| grade_roster[:grade] }
  end

  class Student
    attr_reader :name, :grade

    def initialize(name, grade)
      @name = name
      @grade = grade
    end
  end
end
