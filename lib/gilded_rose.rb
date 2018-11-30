class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    # short circuit if we have the weapon
    return if @name == "Sulfuras, Hand of Ragnaros"

    # decrement days
    # to do: this should be moved to the top of the function, but all other numbers would have to be change

    
    # before sell date
    if @days_remaining > 0
      case @name
      when "Aged Brie"
        @quality += 1
      when "Backstage passes to a TAFKAL80ETC concert"
        if @days_remaining <= 5
          @quality += 3
        elsif @days_remaining <= 10
          @quality += 2
        else
          @quality += 1
        end
      else
        @quality -= 1
      end

    elsif @days_remaining == 0
      case @name
      when "Aged Brie"
        @quality += 2
      else
        @quality -= 2
      end
    elsif @days_remaining < 0
      case @name
      when  "Backstage passes to a TAFKAL80ETC concert"
        @quality = 0
      when "Aged Brie"
          @quality += 2
      else
        @quality -= 2
      end
    end

    #
    # Cleanup 
    ######
    @days_remaining -= 1
    # quality must stay btw 0 and 50
    if @quality > 50
      @quality = 50
    elsif @quality < 0
      @quality = 0
    end  end
end
