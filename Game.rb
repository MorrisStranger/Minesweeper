require "Board.rb"
class Game
    def initialize(board,game_over=false)
    @game_over=game_over
    @board=board
    end
    def render

    end
    def game_over?
    end
    def flag
    end
    def click
    end
    def prompt
        p "type r then a coordinate to reveal"
        p "type f then a coordinate to flag"
        arr=gets.chomp().split("")

        action=arr[0]
        pos=arr[1..-1].map(&:to_i)
    return action,pos
    end
    def move
        action,pos=prompt
        if action =="r" &&  !@board[pos].bomb
            @board[pos].reveal

        elsif action =="f"

            @board[pos].flag
        else
            p "you clicked a bomb!"
            @game_over=true

        end
    end
end