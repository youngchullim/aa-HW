require_relative 'player.rb'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new()}
    prepare_board
  end

  def prepare_board
    @cups.each_with_index do |el, i|
      unless i == 6 || i == 13
        4.times {el << :stone}
      end
    end
    @cups
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' unless (0..13).include?(start_pos)
    raise 'Starting cup is empty' if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    total_stones = @cups[start_pos].count
    @cups[start_pos] = []

    i = start_pos
    until total_stones == 0
      i = (i + 1) % 14

      if @name1 == current_player_name
        next if i == 13
      elsif @name2 == current_player_name
        next if i == 6
      end

      total_stones -= 1
      @cups[i] << :stone
    end
    render
    # puts "@@@@@@@@@@"
    # puts i
    # puts "@@@@@@@@"
    next_turn(i,current_player_name)
  end

  def next_turn(ending_cup_idx, current_player_name)
    # p @cups[ending_cup_idx]
    if @cups[ending_cup_idx].empty?
      return :switch
    elsif ending_cup_idx == 6 && current_player_name = @name1
      return :prompt
    elsif ending_cup_idx == 13 && current_player_name = @name2
      return :prompt
    elsif @cups[ending_cup_idx].count > 0
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    left_side = []
    i = 0
    while i < 6
      left_side += @cups[i]
      i += 1
    end
    left = left_side.count < 1

    right_side = []
    j = 7
    while j < 13
      right_side += @cups[j]
      j += 1
    end
    right = right_side.count < 1
    left || right ? true : false
  end

  def winner
    if @cups[6].count > @cups[13].count
      return @name1
    elsif @cups[6].count < @cups[13].count
      return @name2
    else
      return :draw
    end
  end

end
