require "byebug"
# require_relative "Board.rb"
# require_relative "Tile.rb"
class Tile
    attr_reader :bomb
    @@neighbor_indices=[
        [-1,-1],
        [-1,0],
        [-1,1],
    [0,-1],
    [0,1],
        [1,-1],
        [1,0],
        [1,1]
    ]
  
def initialize(revealed=false,bomb=false,flagged=false,board)
@revealed = revealed
@bomb=bomb
@flagged=flagged
@board=board

end
def flag
@flagged = true
end
    def reveal
@revealed=true
end
def makebomb
@bomb=true
end
# def neighbors
# end
def sum_arrays(arr1,arr2)
    nums = [arr1, arr2]

    nums.transpose.map(&:sum) 
end
def bomb?
self.bomb ? 1 :0
end
def tile_indices
    @board.grid.each.with_index do |row,i|
        row.each.with_index do |tile,j|
            if @board[[i,j]]==self
            return [i,j]
            end
        end
    end
end
def neighbors
    
    neighbors =[]
    @@neighbor_indices.each do |neighbor|
    index = sum_arrays(tile_indices,neighbor)
    neighbors << @board[index]
    end
neighbors
end

def neighbor_bomb_count()
# x,y=pos
bomb_sum=0
neighbors.each do |neighbor|
bomb_sum+=neighbor.bomb?

end
bomb_sum
end

end
