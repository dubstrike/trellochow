require 'trellochow/version'
require 'trello'

module Trellochow
  def self.create_template_card
    configure_trello

    select_board
    select_list
    create_card
    add_checklists
  end

  private
    def self.configure_trello
      trello_developer_public_key = ENV['TRELLO_DEVELOPER_PUBLIC_KEY']
      trello_member_key = ENV['TRELLO_MEMBER_TOKEN']

      unless trello_developer_public_key && trello_member_key
        raise 'Make sure to define your TRELLO_DEVELOPER_PUBLIC_KEY & TRELLO_MEMBER_TOKEN as environment variables.'
      end

      Trello.configure do |config|
        config.developer_public_key = trello_developer_public_key
        config.member_token         = trello_member_key
      end
    end

    def self.select_board
      boards = Trello::Board.all
      boards.each_with_index{ |list, index| puts "#{index} -- #{list.name}" }
      puts 'Select a board by its number:'

      selected_board_index = gets.chomp.to_i
      @board = boards[selected_board_index]
    end

    def self.select_list
      @board.lists.each_with_index{ |list, index| puts "#{index} -- #{list.name}" }
      puts 'Select a list by its number:'

      selected_list_index = gets.chomp.to_i
      @list = @board.lists[selected_list_index]
    end

    def self.create_card
      puts 'Enter the card name:'
      card_name = gets.chomp

      puts 'Enter the card spec:'
      puts '(press CTRL + D to stop writting)'
      card_spec = $stdin.read

      card_description = %{
# Spec:
#{card_spec}

----

# Code:

----
      }

      @card = Trello::Card.create(:list_id => @list.id, :name => card_name, :desc => card_description)
    end

    def self.add_checklists
      checklists = ['Front-End', 'Back-End', 'Metrics']

      checklists.each do |checklist|
        puts "Do you want to add a #{checklist} checklist? [Y/N]"
        add_checklist = gets.chomp
        if add_checklist == 'Y'
          @card.create_new_checklist(checklist)
        end
      end
    end
end
