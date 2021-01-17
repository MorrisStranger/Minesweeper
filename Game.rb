require_relative "Board.rb"
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
            if tile.revealed && tile.neighbor_bomb_count ==0
                value= "_"
                    newrow << value
                
                elsif tile.revealed && !(tile.neighbor_bomb_count ==0)
                    value = tile.neighbor_bomb_count.to_s
                    newrow << value
            
            elsif tile.flagged
                value =  "F"
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
        !@board.grid.flatten.any? {|tile| !(tile.revealed && tile.bomb)}
        # @board.grid.all? {|tile| tile.revealed && !tile.bomb || !tile.revealed && tile.bomb}
        #if there is no tile that hasnt been revealed and is not a bomb then win
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
            p @board[pos].revealed
            p@board[pos].neighbor_bomb_count
            p @board[pos].revealed && !(@board[pos].neighbor_bomb_count ==0)
            p @board[pos].revealed && (@board[pos].neighbor_bomb_count) ==0
            # @board[pos].reveal

        elsif action =="f"

            @board[pos].flag
        

        end
    end
    def recursive_reveal(pos)#
        # if !@board[pos].reveal
        # debugger
        @board[pos].reveal#
        if @board[pos].neighbor_bomb_count==0
            
            @board[pos].neighbors.each do |neighbor|
                # if neighbor.tile_indices != pos
                #if neighbor has neighbors which include pos then delete pos
                if !neighbor.revealed
                recursive_reveal(neighbor.tile_indices)
                end
            end
        end 
    
    end
        # end 
        
    end    
# end


newboard=Board.new()
newboard.create_board
newgame=Game.new(newboard)
newgame.run