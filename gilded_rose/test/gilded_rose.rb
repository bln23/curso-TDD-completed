class GildedRose

  def initialize(items)
    @items = items
    @adapters = {
      "Sulfuras, Hand of Ragnaros" => SulfurasAdapter,
      "Aged Brie" => AgedBrieAdapter,
      "Backstage passes to a TAFKAL80ETC concert" => BackstagePassesAdapter,
      "Regular item" => RegularItemAdapter,
      "Conjured" => ConjuredAdapter
    }
  end

  def update_quality
    @items.each { |item| @adapters[item.name].new(item).update_quality }
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

class SulfurasAdapter
  def initialize(item)
    @item = item
  end

  def update_quality
  end
end

class AgedBrieAdapter
  def initialize(item)
    @item = item
  end

  def update_quality
    @item.sell_in = @item.sell_in - 1
    @item.quality = [50, @item.quality + 1].min
  end
end

class BackstagePassesAdapter
  def initialize(item)
    @item = item
  end

  def update_quality
    @item.sell_in = @item.sell_in - 1
    @item.quality = [50, @item.quality + 1].min
    if @item.sell_in <= 10
      @item.quality = [50, @item.quality + 1].min
    end
    if @item.sell_in <= 5
      @item.quality = [50, @item.quality + 1].min
    end
    if @item.sell_in <= 0
      @item.quality = 0
    end
  end
end

class RegularItemAdapter
  def initialize(item)
    @item = item
  end

  def update_quality
    @item.sell_in = @item.sell_in - 1
    @item.quality = @item.quality - 1
    if @item.sell_in <= 0
      @item.quality = @item.quality - 1
    end
    if @item.quality < 0
      @item.quality = 0
    end
  end
end

class ConjuredAdapter
  def initialize(item)
    @item = item
  end

  def update_quality
    @item.quality = @item.quality - 2
  end
end
