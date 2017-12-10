class SecretNumber
  N = 101
  DEVIATION = 5

  attr_reader :secret

  def initialize
    @secret = rand(N)
  end

  def check(guess)
    guess = guess.to_i
    case guess
    when @secret then 0 # "BINGO!"
    when @secret + 1..@secret + DEVIATION then 1 # "Too HIGH"
    when @secret - DEVIATION...@secret then 2 # "Too LOW"
    when 0...@secret - DEVIATION then 3 # "Way too LOW"
    else 4 # "Way too HIGH"
    end
  end

  def equal?(guess)
    @secret == guess.to_i
  end
end
