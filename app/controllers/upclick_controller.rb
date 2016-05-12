class UpclickController < ApplicationController
  def index
    @total_click_count = Click.count
    if user_signed_in?
      @user_click_count = current_user.clicks.count
    end
  end
  
  def new
    if user_signed_in?
      @click = current_user.clicks.build
      @click.save
      
      highest_level = Level.where("number_of_clicks < ?", current_user.clicks.count).order("number_of_clicks DESC").first
      
      if current_user.level.nil? || current_user.level.number_of_clicks < highest_level.number_of_clicks
        current_user.level = highest_level
        current_user.save
      end
      
    else
      @click = Click.new # anonymous click
      @click.save
    end
    
    newClickResponse = Hash.new
    newClickResponse["total_clicks"] = Click.count
    if user_signed_in?
        newClickResponse["user_clicks"] = current_user.clicks.count
    end
    
    respond_to do |format|
        format.json do
            render json: newClickResponse.to_json
        end
    end
  end
end
