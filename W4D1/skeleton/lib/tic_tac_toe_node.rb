require_relative 'tic_tac_toe'

class TicTacToeNode
  
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if board.over?
      return false if board.winner.nil? || board.winner == evaluator
      return true if board.winner != evaluator
    end
    
    if evaluator == next_mover_mark #we are the player
      self.children.each do |child_node|
        return false if !child_node.losing_node?(evaluator)
      end
      return true
    elsif evaluator != next_mover_mark #we are not the player
      self.children.each do |child_node|
        return true if child_node.losing_node?(evaluator)
      end
      return false
    end
  end

  # # def winning_node?(evaluator)
  # # end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
      children_arr = []
      (0...3).each do |idx1|
        (0...3).each do |idx2|
          current = [idx1,idx2] #parent X [0,0]
          if @board.empty?(current) #possbile X positions
            new_board = board.dup
            new_board[current] = next_mover_mark #X
            next_mover_mark == :x ? next_mover_mark = :o : next_mover_mark = :x
            children_arr << TicTacToeNode.new(new_board, next_mover_mark, current) #0
          end
        end
      end
      children_arr
    end

end
