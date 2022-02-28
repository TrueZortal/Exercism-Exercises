# frozen_string_literal: true

class Garden
  @@plants = {
    'G' => :grass,
    'C' => :clover,
    'R' => :radishes,
    'V' => :violets
  }

  def initialize(garden_text, students = %w[alice bob charlie david eve fred ginny harriet
                                            ileana joseph kincaid larry])
    @students = students.sort.map(&:downcase)
    @garden = garden_text.lines
    create_individual_student_methods
  end

  def create_individual_student_methods
    @students.each do |student|
      define_singleton_method(student) do
        index = @students.index(student) * 2
        garden = [@@plants[@garden[0][index]], @@plants[@garden[0][index + 1]], @@plants[@garden[1][index]],
                  @@plants[@garden[1][index + 1]]]
        garden
      end
    end
  end
end
