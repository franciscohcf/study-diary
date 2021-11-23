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
    study_diary.wait
  when 2
    study_diary.delete
    study_diary.wait
  when 3
    study_diary.finish
    study_diary.wait
  when 4
    study_diary.all
    study_diary.wait
  when 5
    study_diary.search
    study_diary.wait
  when 6
    study_diary.list
    study_diary.wait
  when 7
    puts
    "A aplicação está sendo encerrada!"
    break
  end
end
