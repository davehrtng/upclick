class UpclickController < ApplicationController
  def index
    @total_click_count = Click.count
    if user_signed_in?
      @user_click_count = current_user.gamer.clicks.count
    end
  end
  
  def new
    newClickResponse = Hash.new
    
    if user_signed_in?
      @click = current_user.gamer.clicks.build
      @click.save
      
      highest_level = Level.where("number_of_clicks <= ?", current_user.gamer.clicks.count).order("number_of_clicks DESC").first
      
      if highest_level && (current_user.gamer.level.nil? || current_user.gamer.level.number_of_clicks < highest_level.number_of_clicks)
        current_user.gamer.level = highest_level
        current_user.gamer.save
        
        newLevelResponse = Hash.new
        newLevelResponse["level_name"] = highest_level.name
        newLevelResponse["image_path"] = "/assets/" + highest_level.image_name
        newLevelResponse["message"] = "Leveled up to " + highest_level.name
        
        newClickResponse["new_level"] = newLevelResponse 
      end
      newClickResponse["user_clicks"] = current_user.gamer.clicks.count
    else
      @click = Click.new # anonymous click
      @click.save
    end
    
    
    newClickResponse["total_clicks"] = Click.count
    
    respond_to do |format|
        format.json do
            render json: newClickResponse.to_json
        end
    end
  end
end
