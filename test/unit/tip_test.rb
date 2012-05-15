require 'test_helper'

class TipTest < ActiveSupport::TestCase
  test "returns untweeted events on .untweeted" do
    untweeted = Array.new
    3.times { untweeted << FactoryGirl.create(:tip) }
    assert_equal Tip.untweeted, untweeted
  end

  test "return tips that have been tweeted on .tweeted" do
    tweeted = Array.new
    3.times { tweeted << FactoryGirl.create(:tip, :tweeted_at => Time.now) }
    assert_equal Tip.tweeted, tweeted
  end

  test "return a random untweeted tip on .random" do
    3.times { FactoryGirl.create(:tip) }
    tip = Tip.random
    assert tip.is_a? Tip
    assert tip.tweeted_at.blank?
  end

  test "invalid without a body" do
    tip = Tip.new
    assert !tip.valid?
  end
end
