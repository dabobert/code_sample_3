# i SERIOUSLY thought of just turning everything into objects but thought it be overkill

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

    @days_remaining -= 1
    
    # before sell date
    if @days_remaining > 0

      case @name
      when "Aged Brie"
        @quality += 1
      when "Backstage passes to a TAFKAL80ETC concert"
        puts
        puts "#{@name}===================="
        puts "@days_remaining: #{@days_remaining}"
        puts "before quality: #{@quality}"
        if @days_remaining > 10
          @quality += 1
        elsif @days_remaining >= 6
          @quality += 2
        else
          puts "1-----#{@quality}----"
          @quality += 3
          puts "2-----#{@quality}----"
        end
        puts "after quality: #{@quality}"
      else
        @quality -= 1
      end

    elsif @days_remaining == 0

      case @name
      when "Aged Brie"
        @quality += 2
      end

    elsif @days_remaining < 0

      case @name
      when  "Backstage passes to a TAFKAL80ETC concert"
        @quality = 0
      when "Aged Brie"
        @quality += 2
      else
#CHECK THIS OUT        
        @quality -= 2

      end
    end

    # quality must stay btw 0 and 50
    if @quality > 50
      @quality = 50
    elsif @quality < 0
#CHECK THIS OUT        

      @quality = 0
    end
  end
end
