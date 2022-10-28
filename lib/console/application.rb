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
        puts "戰鬥開始了⋯⋯"
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
        @battle.apply Battle::Events::JoinedEvent.new(
          actor_id: 0, name: name, hp: 100
        )

        @battle.apply Battle::Events::JoinedEvent.new(
          actor_id: 1, name: '哥布林', hp: 100
        )
      end
    end

    def user_action
      CLI::UI::Frame.open('行動') do
        CLI::UI::Prompt.ask('要進行什麼行動') do |handler|
          handler.option('攻擊')  { |selection| do_attack }
          handler.option('離開')  { |selection| @battle.exit }
        end
        flush
      end
    end

    def do_attack
      @battle.apply Battle::Events::DamagedEvent.new(
        from_id: 0,
        to_id: 1,
        amount: 10
      )
      true
    end
  end
end
