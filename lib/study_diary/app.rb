# frozen_string_literal: true

require_relative 'category'
require_relative 'study_item'
require_relative 'study_diary'

study_diary = StudyDiary.new

loop do
  study_diary.menu

  case study_diary.option
  when 1
    study_diary.add
  when 2
    study_diary.delete
  when 3
    study_diary.finish
  when 4
    study_diary.all
    puts
    puts 'Pressione qualquer tecla para continuar'
    STDIN.getc
  when 7
    puts
    "A aplicação está sendo encerrada!"
    break
  end
end
