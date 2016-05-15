class Gamer < ActiveRecord::Base
    belongs_to :level
    
    has_many :clicks
end
