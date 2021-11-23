# frozen_string_literal: true

class StudyDiary
  require_relative 'category'
  require_relative 'study_item'
  attr_reader :contents
  attr_accessor :option

  def initialize
    @contents = {}
  end

  def menu
    puts '[1] Cadastrar um item para estudar'
    puts '[2] Apagar um item de estudo'
    puts '[3] Marcar um item como concluído'
    puts '[4] Ver todos os itens cadastrados'
    puts '[5] Buscar um item de estudo'
    puts '[6] Listar por categoria'
    puts '[7] Sair'
    puts
    puts 'Escolha uma opção:'
    puts

    @option = gets.to_i
  end

  def add
    puts 'Informe o título do item:'
    title = gets.chomp
    puts

    puts 'Informe qual a categoria do item:'
    category = gets.chomp
    puts

    puts 'Deseja adicionar uma descrição ao item? [s/n]'
    option = gets.chomp
    puts

    if option == 's'
      puts 'Insira a descrição do item:'
      description = gets.chomp
      puts
    end

    study_item = StudyItem.new(title: title, description: description, category: category)

    @contents[title] = study_item

    puts 'Cadastro concluído com sucesso'
    puts
  end

  def delete
    puts
    puts 'Insira o título do item que deseja deletar'
    temp = gets.chomp
    @contents.delete(temp)
    puts 'Item deletado com sucesso'
    puts
  end

  def all
    if @contents.empty?
      puts 'No momento não existem itens cadastrados'
      puts
    else
      puts 'ITENS'
    end

    @contents.each do |i|
      puts
      puts "Título: #{i[0]}"
      puts "Descrição: #{i[1].description}" unless i[1].description.nil?
      puts i[1].check == true ? 'Item concluído' : 'Pendente'
      puts
    end
  end

  def finish
    puts
    puts 'Insira o titulo do item a ser marcado como concluído'
    temp = gets.chomp
    @contents[temp].check = true
    puts 'Item marcado com sucesso'
  end

  def search
    puts
    puts 'Insira uma palavra chave para a busca'
    temp = gets.chomp

    @contents.each do |i|
      next unless i[1].title.include?(temp) || i[1].description.include?(temp)

      puts "Título: #{i[0]}"
      puts "Descrição: #{i[1].description}" unless i[1].description.nil?
      puts i[1].check == true ? 'Item concluído' : 'Pendente'
      puts
    end
  end

  def list
    puts
    puts 'Insira a categoria a ser listada'
    temp = gets.chomp
    puts
    puts temp.upcase
    puts
    @contents.each do |i|
      next unless i[1].category.name == temp

      puts "Título: #{i[0]}"
      puts "Descrição: #{i[1].description}" unless i[1].description.nil?
      puts i[1].check == true ? 'Item concluído' : 'Pendente'
      puts
    end
  end

  def wait
    puts
    puts 'Pressione qualquer tecla para continuar'
    $stdin.getc.chomp
  end
end
