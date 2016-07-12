
class Board
  attr_accessor :width,:height

  def initialize(cells=[], width = 3, height = 3)
    @cells = cells
    @height = height
    @width = width
  end

  def live_cells
    @cells
  end

  def is_alive?(x,y)
    @cells.include?([x,y])
  end

  def neighbors_to(x,y)
    @cells.select do |cell_x, cell_y|
      dx = (x-cell_x).abs
      dy = (y-cell_y).abs
      #If the tuple x,y is a neighbor of that cell then the following is true
      dx <= 1 and dy <= 1 and not (dx == 0 and dy == 0)
    end.length
    #We only care how many there are and do not care which cells in particular
  end

  def evolve
    survivors = []
    #Scan the entire board (may be able to be more clever here but you need to check each dead cell for resurrection)
    @width.times do |x|
      @height.times do |y|
        survivors << [x,y] if should_survive?(x,y) or should_resurrect?(x, y)
      end
    end
    #Populating the new board from survivors allows reference to the current generation while populating the next generation
    Board.new(survivors, self.width,self.height)
  end

  def should_survive?(x,y)
    (neighbors_to(x,y) == 2 or neighbors_to(x,y) == 3) and is_alive?(x,y)
  end

  def should_resurrect?(x, y)
    neighbors_to(x,y) == 3 and not is_alive?(x,y)
  end

  def print_board
    puts 'Current Generation'
    puts
    @width.times do |x|
      @height.times do |y|
        print "#{is_alive?(x,y) ? '#' : '-'}"
      end
      puts
    end
    puts
  end

end