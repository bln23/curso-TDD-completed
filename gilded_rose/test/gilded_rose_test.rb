require_relative './gilded_rose'
require "minitest/autorun"


class GildedRoseTest < Minitest::Test
  def test_should_decrease_sell_in_after_update_quality
    items = [item_with(name: "Regular item", sell_in: 3)]
    GildedRose.new(items).update_quality

    assert_equal 2, items[0].sell_in
  end

  def test_should_decrease_quality_after_update_quality
    items = [item_with(name: "Regular item", sell_in: 3, quality: 3)]
    GildedRose.new(items).update_quality

    assert_equal 2, items[0].quality
  end

  def test_should_decrease_quality_twice_as_fast_once_the_sell_by_date_has_passed
    items = [item_with(name: "Regular item", sell_in: 0, quality: 3)]
    GildedRose.new(items).update_quality

    assert_equal 1, items[0].quality
  end

  def test_should_never_have_quality_below_zero
    items = [item_with(name: "Regular item", sell_in: 3, quality: 0)]
    GildedRose.new(items).update_quality

    assert_equal 0, items[0].quality
  end

  def test_should_decrease_sell_in_after_update_quality
    items = [item_with(name: "Aged Brie", sell_in: 3)]
    GildedRose.new(items).update_quality

    assert_equal 2, items[0].sell_in
  end

  def test_should_increase_quality_as_its_sell_in_value_approaches
    items = [item_with(name: 'Aged Brie', sell_in: 4, quality: 20)]
    GildedRose.new(items).update_quality

    assert_equal 21, items[0].quality
  end

  def test_never_has_more_than_50_as_quality
    items = [aged_brie_with_quality(50)]
    GildedRose.new(items).update_quality

    assert_equal 50, items[0].quality
  end

  def test_never_decreases_its_quality
    items = [item_with(name: 'Sulfuras, Hand of Ragnaros', quality: 80)]
    GildedRose.new(items).update_quality

    assert_equal 80, items[0].quality
  end


  def test_never_decreases_its_sell_in
    items = [item_with(name: 'Sulfuras, Hand of Ragnaros', sell_in: 5)]
    GildedRose.new(items).update_quality

    assert_equal 5, items[0].sell_in
  end

  def test_sell_in_always_decreases
    items = [item_with(name: 'Backstage passes to a TAFKAL80ETC concert', sell_in: 2)]
    GildedRose.new(items).update_quality

    assert_equal 1, items[0].sell_in
  end


  def test_increases_its_quality_as_sell_in_approaches
    items = [item_with(name: 'Backstage passes to a TAFKAL80ETC concert', sell_in: 12, quality: 2)]
    GildedRose.new(items).update_quality

    assert_equal 3, items[0].quality
  end

  def test_increases_its_quality_twice_as_fast_when_there_are_10_days_or_less
    items = [item_with(name: 'Backstage passes to a TAFKAL80ETC concert', sell_in: 10, quality: 2)]
    GildedRose.new(items).update_quality

    assert_equal 4, items[0].quality
  end

  def test_increases_its_quality_by_3_when_there_are_5_days_or_less
    items = [item_with(name: 'Backstage passes to a TAFKAL80ETC concert', sell_in: 5, quality: 2)]
    GildedRose.new(items).update_quality

    assert_equal 5, items[0].quality
  end

  def test_drops_quality_to_0_after_the_concert
    items = [item_with(name: 'Backstage passes to a TAFKAL80ETC concert', sell_in: 0, quality: 2)]
    GildedRose.new(items).update_quality

    assert_equal 0, items[0].quality
  end

  def test_never_has_more_than_50_as_quality
    items = [item_with(name: 'Backstage passes to a TAFKAL80ETC concert', sell_in: 5, quality: 49)]
    GildedRose.new(items).update_quality

    assert_equal 50, items[0].quality
  end

  def test_should_decrease_quality_twice_as_fast_as_normal_items
    items = [item_with(name: "Conjured", sell_in: 0, quality: 3)]
    GildedRose.new(items).update_quality

    assert_equal 1, items[0].quality
  end

  def aged_brie_with_quality(quality)
    item_with(name: 'Aged Brie', sell_in: 4, quality: quality)
  end

  def item_with(name:'Default', sell_in: 4, quality: 40)
    Item.new(name, sell_in, quality)
  end
end
