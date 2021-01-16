require "byebug"
# require_relative "Board.rb"
# require_relative "Tile.rb"
class Tile
    attr_reader :bomb
    @@neighbors=[
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
def reveal
@revealed=true
end
def makebomb
@bomb=true
end
def neighbors
end
def sum_arrays(arr1,arr2)
    nums = [arr1, arr2]

    nums.transpose.map(&:sum) 
end
def bomb?(value)
value ? 1 :0
end
def neighbor_bomb_count()
# x,y=pos
# debugger
bomb_sum=0
@board.grid.each.with_index do |row,i|

    row.each.with_index do |tile,j|
        if @board[[i,j]]==self
        #    return i,j
        @@neighbors.each do |neighbor|
        index = sum_arrays([i,j],neighbor)
        bomb_sum += bomb?(@board[index].bomb)
        end
        return bomb_sum
        end
    end
    
end

end

end
