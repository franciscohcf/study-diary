# frozen_string_literal: true

class StudyDiary
  require_relative 'category'
  require_relative 'study_item'
  attr_reader :contents

  def initialize
    @contents = {}
  end

  def add(category:, title:, description:)
    study_item = StudyItem.new(title: title, description: description, category: category)

    @contents[title] = study_item
  end

  def all
    @contents.each do |i|
      puts "Title: #{i[0]}"
      puts "Description: #{i[1].description}"
      puts
    end
  end
end
