# frozen_string_literal: true

class StudyItem
  require_relative 'category'

  attr_reader :title, :description, :category
  attr_accessor :check

  def initialize(category:, title: 'Sem Titulo', description: '')
    @title = title
    @description = description
    @category = Category.new(name: category)
    @check = false
  end
end
