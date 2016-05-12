require 'test_helper'

class LevelWorkerTest < ActiveSupport::TestCase
  def test_compute_level
    assert LevelWorker.computeLevel(200) != nil
  end
end
