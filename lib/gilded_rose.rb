class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    if @name == "Aged Brie" || @name == "Backstage passes to a TAFKAL80ETC concert"
      if @quality < 50
        @quality = @quality + 1
        if @name == "Backstage passes to a TAFKAL80ETC concert"
          if @days_remaining < 11
            if @quality < 50
              @quality = @quality + 1
            end
          end
          if @days_remaining < 6
            if @quality < 50
              @quality = @quality + 1
            end
          end
        end
      end
    else
      if @quality > 0
        if @name != "Sulfuras, Hand of Ragnaros"
          @quality = @quality - 1
        end
      end
    end

    if @name != "Sulfuras, Hand of Ragnaros"
      @days_remaining = @days_remaining - 1
    end

    if @days_remaining < 0 # && ["Aged Brie", ]
      if @name == "Backstage passes to a TAFKAL80ETC concert"
        @quality = 0
      elsif @name == "Aged Brie"
        if @quality < 50
          @quality += 1
        end
      else
        if @quality > 0
          if @name != "Sulfuras, Hand of Ragnaros"
            @quality -= 1
          end
        end
      end
    end
  end
end
