class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14){Array.new( [:stone, :stone, :stone, :stone])}
    place_stones
    @player1 = name1
    @player2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups[6] = []
    @cups[13] = []
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 12 || start_pos == 6 
      raise 'Invalid starting cup'
    end
    if @cups[start_pos].empty?
      raise 'Starting cup is empty'
    end
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos].length
    @cups[start_pos] = []
    i = 1 
    while i < stones + 1
      if current_player_name == @player1 && (start_pos + i) % 14 == 13
        i +=1
        stones +=1
      elsif current_player_name == @player2 && (start_pos + i) % 14 == 6
        i +=1
        stones +=1
      else 
        @cups[(start_pos + i) % 14] << :stone
        i +=1
      end
    end
    render
    next_turn((start_pos + stones) % 14)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    else
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
    (0...5).all? {|i| @cups[i].empty?} || (7..12).all?{|i| @cups[i].empty?}
  end

  def winner
    case @cups[6] <=> @cups[13]
    when 1
      return @player1
    when - 1
      return @player2
    when 0 
      return :draw
    end
  end
end