require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = Board.new
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
      children_arr = []
      moves = self.find_valid_move
      moves.each do |position| #position
        children_arr << TicTacToeNode.new(board, next_mover_mark,position)
      end
    end
  end

  def find_valid_move
    valid_move = []
    (0...@board.length).each do |idx1|
      (0...@board.length).each do |idx2|
        current = [idx1,idx2]
        if @board.empty?(current)
          valid_move << current
        end
      end
    end
    valid_move
  end

end
