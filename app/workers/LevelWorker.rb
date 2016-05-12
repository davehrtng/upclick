class LevelWorker 
  def self.computeLevel(number_of_clicks)
    return Level.where("number_of_clicks < ?", number_of_clicks).order("number_of_clicks DESC").first
  end
end