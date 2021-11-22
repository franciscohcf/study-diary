# frozen_string_literal: true

module StudyDiary
  class Category
    attr_reader :name

    def initialize(name: 'Misc')
      @name = name
    end
  end
end
