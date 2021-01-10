class Tile
def initialize(revealed=false,bomb,flagged,board)
@revealed = revealed
@bomb=bomb
@flagged=flagged
@board=board
end
def reveal
@revealed=true
end
def neighbors
end
def neighbor_bomb_count

end

end