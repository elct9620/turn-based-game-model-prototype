# frozen_string_literal: true

module Console
  class Application
    def initialize
      @battle = Battle::View.new
      @output = Battle::Output.new(@battle)
    end

    def start
      join
      CLI::UI::Frame.open('系統') do
        puts '戰鬥開始了⋯⋯'
        flush
      end
      user_action until @battle.finished?
    end

    def flush
      puts @output.next while @output.next?
    end

    def join
      CLI::UI::Frame.open('系統') do
        name = CLI::UI.ask('挑戰者，你的名字是？')
        Commands::JoinCommand.new(name: name).execute(@battle)
      end
    end

    def user_action
      CLI::UI::Frame.open('行動') do
        CLI::UI::Prompt.ask('要進行什麼行動') do |handler|
          handler.option('攻擊')  { |_selection| do_attack }
          handler.option('逃跑')  { |_selection| do_escape }
          handler.option('離開')  { |_selection| @battle.exit }
        end
        flush
      end
    end

    def do_attack
      Commands::AttackCommand.new.execute(@battle)
    end

    def do_escape
      Commands::EscapeCommand.new.execute(@battle)
    end
  end
end
