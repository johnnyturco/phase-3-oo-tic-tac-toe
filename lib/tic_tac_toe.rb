class TicTacToe
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        user_input.to_i - 1
    end

    def move(index, token="X")
        @board[index] = token
    end

    # def position_taken?(index)
    #     if @board[index] == " "
    #         false
    #     else
    #         true
    #     end
    # end

    def position_taken?(index)
        @board[index] != " "
    end

    # def valid_move?(position_to_check)
    #     if position_to_check < 10 && @board[position_to_check]==" "
    #         true
    #     else
    #         false
    #     end
    # end

    def valid_move?
        !position_taken?(index) && index.between?(0,8)
    end

    # def turn_count
    #     9-@board.count(" ")
    # end

    def turn_count
        @board.count{|square| != " "}
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    # def turn
    #     puts "Enter move."
    #     move = gets.chomp
    #     indexed = input_to_index(move)

    #     if valid_move?(indexed)
    #         current = current_player
    #         move(indexed, current)
    #         display_board
    #     else
    #         turn
    #     end
    # end

    def turn
        puts "Please enter a number (1-9):"
        user_input = gets.strip
        index = input_to_index(user_input)

        if valid_move?(index)
            token = current_player
            move(index, token)
        else
            turn
        end

        display_board
    end

    def won?
        WIN_COMBINATIONS.any? do |match|
            if position_taken?(match[0]) && @board[match[0]) == @board[match[1]]] && @board[match[1] == @board[match[2]]]
                return match
            end
        end
    end

    def full?
        @board.all?{|square| square != " "}
    end

    def draw?
        full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        if combo == won?
            @board[combo[0]]
        end
    end

    def play
        turn until over?
        puts winner ? "Congratulations, #{winner}!" : "Cat's Game!"
    end
end
game = TicTacToe.new
game.play