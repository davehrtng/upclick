class UpclickController < ApplicationController
  def index
    @count = Click.count
  end
  
  def new
    if user_signed_in?
      @click = current_user.clicks.build
    else
      @click = Click.new # anonymous click
    end
    @click.save
    redirect_to root_path
  end
end
