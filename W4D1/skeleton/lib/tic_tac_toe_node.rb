require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  attr_reader :board, :next_mover_mark, :prev_move_pos
  # def losing_node?(evaluator)
  #   return true if @board.over? && @board.winner != evaluator
  #   return false if @board.winner.nil? || @board.winner == evaluator
  #   if turn == evaluator && losing_node?()

  #   elsif turn != evaluator
  #   end
  #   losing_node?()
  # end

  # # def winning_node?(evaluator)
  # # end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
      children_arr = []
      if next_mover_mark == :x
        next_mover_mark = :o
      else
        next_mover_mark = :x
      end
      (0...3).each do |idx1|
        (0...3).each do |idx2|
          current = [idx1,idx2]
          if @board.empty?(current)
            new_board = board.dup
            children_arr << TicTacToeNode.new(new_board, next_mover_mark, current)
            
          end
        end
      end
      children_arr
  end


end
