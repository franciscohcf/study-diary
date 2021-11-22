# frozen_string_literal: true

module StudyDiary
  class StudyItem
    attr_reader :title, :description, :category

    def initialize(category:, title: 'Sem Titulo', description: '')
      @title = title
      @description = description
      @category = Category.new(gets)
    end
  end
end