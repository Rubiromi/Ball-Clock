class BallClock

  def initialize(balls)
    @balls = balls
    @queue = (1.upto(@balls)).to_a
    @test = @queue.clone
    @one = []
    @five = []
    @sixty = []
    @count = 0
  end

  def one_cycle
    ball = get_next_ball

    if @one.length < 4
      @one << ball
    else
      @queue += @one.reverse
      @one.clear

      if @five.length < 11
        @five << ball
      else
        @queue += @five.reverse
        @five.clear

        if @sixty.length < 11
          @sixty << ball
        else
          @queue += @sixty.reverse
          @sixty.clear
          @queue << ball
        end
      end
    end
  end

  def get_next_ball
    @queue.shift
  end

  def run_simulation(num_of_minutes = 0)
    if num_of_minutes == 0
      loop do
        one_cycle
        @count += 1
        break if @queue == @test
      end
      puts "#{@balls} balls cycle after #{(@count / (24 * 60))} days."
    else
      num_of_minutes.times do
        one_cycle
        @count += 1
      end
      puts "{\"Min\": #{@one}, \"FiveMin\": #{@five} , \"Hour\": #{@sixty}, \"Main\": #{@queue}}"
    end
  end
end

bc = BallClock.new(30)
bc.run_simulation(325)
