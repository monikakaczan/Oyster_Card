class Oystercard

   attr_reader :balance, :stations, :in_journey

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_CHARGE = 1


    def initialize
      @balance = 0
      @in_journey = false
      @stations = []
    end

    def top_up(value)

      raise "Maximum balance is exceeded!" if @balance + value > MAX_BALANCE

      @balance += value

    end

    def in_journey?
      @in_journey
    end

    def touch_in(station)
      raise "Errrr, no money" if @balance < MIN_BALANCE

      @in_journey = true
      @stations << station

    end

    def touch_out(station)
      deduct(MIN_BALANCE)
      @in_journey = false
      @stations = []
    end

    private
    def deduct(value)
      @balance -=value
    end
end
