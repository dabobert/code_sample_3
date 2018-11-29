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

    if @name == "Aged Brie"
      @quality += 1 if @quality < 50
    elsif @name == "Backstage passes to a TAFKAL80ETC concert"
      if @quality < 50
        @quality += 1
        @quality += 1 if @days_remaining < 11 
        @quality += 1 if @days_remaining < 6
      end
    else
      @quality -= 1 if @quality > 0
    end

    # decrement days
    # to do: this should be moved to the top of the function, but all other numbers would have to be change
    @days_remaining -= 1
    
    if @days_remaining < 0
      case @name
      when  "Backstage passes to a TAFKAL80ETC concert"
        @quality = 0
      when "Aged Brie"
        if @quality < 50
          @quality += 1
        end
      else
        # didnt do elsif because it's a different comparison
        if @quality > 0
          @quality -= 1
        end
      end
    end
  end
end
