require_relative "Tile.rb"
class Board
    # attr_accessor :grid
    def initialize()
        # create_board
        # @grid=grid
        
    end
    
    def create_board
        # debu#gger
        @grid=Array.new(9) do 
            Array.new(9) {Tile.new(self)}
        end
        indices=(0..8).to_a
        already_seen=[]
        50.times do 
        i=indices.sample
        j=indices.sample
        
        if !already_seen.include?([i,j])
            @grid[i][j].makebomb
        end
            already_seen << [i,j]
        end
        @grid

    end
    # def grid
    # @grid
    # end
    def [](pos)
    x,y=pos
    @grid[x][y]
    end
def grid
    @grid
end
end
# p newboard

# p newboard[[0,1]].neighbor_bomb_count
# p newboard.grid
newboard=Board.new()
newboard.create_board
p newboard[[0,1]].neighbor_bomb_count