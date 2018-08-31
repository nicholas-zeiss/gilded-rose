class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    if @name == 'Conjured Mana Cake'
      @quality = @quality - 2
    elsif @name != 'Aged Brie' && @name != 'Backstage passes to a TAFKAL80ETC concert'
      if @quality > 0
        if @name != 'Sulfuras, Hand of Ragnaros'
          @quality = @quality - 1
        end
      end
    else
      if @quality < 50
        @quality = @quality + 1

        if @name == 'Backstage passes to a TAFKAL80ETC concert'
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
    end

    if @name != 'Sulfuras, Hand of Ragnaros'
      @days_remaining = @days_remaining - 1
    end

    if @days_remaining < 0
      if @name == 'Conjured Mana Cake'
        if @quality > 0
          @quality = @quality - 2
        end
      elsif @name != 'Aged Brie'
        if @name != 'Backstage passes to a TAFKAL80ETC concert'
          if @quality > 0
            if @name != 'Sulfuras, Hand of Ragnaros'
              @quality = @quality - 1
            end
          end
        else
          @quality = @quality - @quality
        end
      else
        if @quality < 50
          @quality = @quality + 1
        end
      end
    end

    @quality = 0 if @quality < 0
  end
end
