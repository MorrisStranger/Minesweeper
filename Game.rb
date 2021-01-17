require_relative "Board.rb"


'''put raise conditions for invalid input
make render look better
find way of passing pos to Tile class
rest of project
'''
class Game
    def initialize(board,game_over=false)
        @game_over=game_over
        @board=board
    end
    def render
        newrow=[]
        minefield=[]
        # debugger
        @board.grid.each do |row|
        row.each do |tile|
            # p tile
        if tile.flagged
            value =  "F"

            newrow << value
        
    elsif tile.revealed && tile.neighbor_bomb_count ==0
                value= "_"
                    newrow << value
               
                
                elsif tile.revealed && !(tile.neighbor_bomb_count ==0)
                    value = tile.neighbor_bomb_count.to_s
                    newrow << value
            
            
            else 
                value = "*"
                newrow << value 
            end
           print value + " "
        end
        puts
        minefield << newrow
        newrow=[]

    end
    minefield
#    p minefield
    end
    # minefield
    # end

    def won?
        @board.grid.flatten.none? {|tile| !(tile.revealed && tile.bomb)}
    end
    def lost?
        @board.grid.flatten.any? {|tile| tile.revealed && tile.bomb}
        
    end
    def game_over?
    won? || lost?
    end
    def run
         
        until game_over?
        render
        move

        end
        if won?
            p "you won"
        elsif lost?
            p "you clicked a bomb"
        end
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
        if action =="r"
            # @board[pos].reveal
            recursive_reveal(pos)
            
            # @board[pos].reveal

        elsif action =="f"
            # p @board[pos].flagged
            p @board[pos]
            @board[pos].flag
            
        

        end
    end
    def recursive_reveal(pos)
 
        @board[pos].reveal
        if @board[pos].neighbor_bomb_count==0
            
            @board[pos].neighbors.each do |neighbor|
           
                if !neighbor.revealed
                recursive_reveal(neighbor.tile_indices)
                end
            end
        end 
    
    end
        
    end    


newboard=Board.new()
newboard.create_board
newgame=Game.new(newboard)
newgame.run