class Oystercard

  attr_reader :balance
  MAX_BALANCE = 90
    def initialize
      @balance = 0
    end

    def top_up(value)

      raise "Maximum balance is exceeded!" if @balance + value > 90
      @balance += value

    end
end
