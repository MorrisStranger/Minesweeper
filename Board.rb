class Board
    def initialize(grid)
        @grid=grid
    end
    def self.create_board 
        Array.new(9) do 
            Array.new(9) {Tile.new(bomb=false,board=self)}
        end
    end
end