class Oystercard

   attr_reader :balance, :stations, :in_journey, :full_journey

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_CHARGE = 1


    def initialize
      @balance = 0
      @in_journey = false
      @stations = []

      ##
      @full_journey = {}
      ##
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

    def touch_out(station2)
      deduct(MIN_BALANCE)
      @in_journey = false
      @stations << station2
    end

    ##
    def save_journeys

      @stations.insert(0, :entry_station)
      @stations.insert(2, :exit_station)

      @full_journey = Hash[*stations]

    end
    ##
    private
    def deduct(value)
      @balance -=value
    end
end
