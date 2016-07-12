require 'spec_helper'

describe Board do

  context "#new" do
    it "should be created empty if passed empty array" do
      Board.new([]).live_cells.should be_empty
    end

    it "should be created empty if passed nothing at all" do
      Board.new
    end

    it "should contain the cells created with it" do
      Board.new([[1,1],[2,2]]).live_cells.should be ==[[1,1],[2,2]]
    end

  end

  context "#evolve" do

    it "should evolve an empty board if empty" do
      next_gen = next_generation_for([])
      next_gen.should be_empty
    end

    it "should kill a lonely cell (< 2 neighbors)" do
      next_gen = next_generation_for([[1,1]])
      next_gen.should be_empty
    end

    it "should keep a cell with 2 neighbors alive" do
      #pending("We need to count neighbors")
      next_gen = next_generation_for([[1,1],[1,2],[1,0]])
      next_gen.should include([1,1])
    end

    it "should keep a cell with 3 neighbors alive" do
      #pending("We need to count neighbors")
      next_gen = next_generation_for([[1,1],[1,2],[1,0],[0,0]])
      next_gen.should include([1,1])
    end

    it "should revive a dead cell with 3 neighbors (reproduction)" do
      #pending("Dimensions of the board to find dead cells")
      next_gen = next_generation_for([[1,0],[0,1],[2,1]])
      next_gen.should include([1,1])
    end

    it "should kill any cell with more than 3 neighbors" do
      next_gen = next_generation_for([[0,1],[2,1],[1,2],[1,0],[1,1]])
      next_gen.should_not include([1,1])
    end
  end

  def next_generation_for(seed,width = 3, height = 3)
    board = Board.new(seed, width, height)
    board.evolve.live_cells
  end


  it "should be able to handle the blinker formation 10 times" do
    seed = [[1,2],[1,1],[1,0]]
    n = 0
    while n<=10
      next_gen = next_generation_for(seed)
      next_gen.should satisfy{|cells| cells =~[[0,1],[1,1],[2,1]] or [[1,2],[1,1],[1,0]]}
      seed = next_gen
      n+=1
    end
  end

  it "should be able to handle the block formation 10 times" do
    seed = [[1,1],[2,1],[2,2],[1,2]]
    n = 0
    while n <= 10
      next_gen = next_generation_for(seed)
      next_gen.should =~ [[1,1],[2,1],[2,2],[1,2]]
      seed = next_gen
      n+=1
    end
  end

  it "should be able to handle the beehive formation 10 times" do
    seed = [[1,0],[2,0],[3,1],[2,2],[1,2],[0,1]]
    n = 0
    while n <= 10
      next_gen = next_generation_for(seed,4,4)
      next_gen.should =~ [[1,0],[2,0],[3,1],[2,2],[1,2],[0,1]]
      seed = next_gen
      n+=1
    end
  end

  it "should be able to print the current board" do
    board = Board.new([[1,1],[0,1],[0,2]],5,5)
    board.print_board
  end
end

describe Board, "counting neighbors" do

  it "should find zero neighbors to a solitary cell" do
    board = Board.new([[1,1]])
    board.neighbors_to(1,1).should == 0
  end

  it "should find one neighbor to a single cell" do
    board = Board.new([[1,1]])
    board.neighbors_to(0,0).should == 1
    board.neighbors_to(0,1).should == 1
    board.neighbors_to(0,2).should == 1
    board.neighbors_to(1,2).should == 1
    board.neighbors_to(2,2).should == 1
    board.neighbors_to(2,1).should == 1
    board.neighbors_to(2,0).should == 1
    board.neighbors_to(1,0).should == 1
  end

  it "should find two neighbors to cells if needed" do
    board = Board.new([[0,1],[2,2]])
    board.neighbors_to(1,1).should == 2
    board.neighbors_to(1,2).should == 2
  end

  it "should find three neighbors to cells if needed" do
    board = Board.new([[0,1],[2,2],[1,2]])
    board.neighbors_to(1,1).should == 3
    board.neighbors_to(2,2).should == 1
  end

end