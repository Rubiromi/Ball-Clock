class BallClock
  def initialize(balls)
    @queue = (0.upto(balls - 1)).to_a
    @test = @queue.clone
    @one = []
    @five = []
    @sixty = []
  end

  def one_cycle
    ball = get_next_ball

    if one.length < 4
      one << ball
    else
      queue += one.reverse
      one.clear
      if five.length < 11
        five << ball
      else
        queue += five.reverse
        five.clear
        if sixty.length < 11
          sixty << ball
        else
          queue += sixty.reverse
          sixty.clear
          queue << ball
  end

  def get_next_ball
    queue.shift
  end
end
