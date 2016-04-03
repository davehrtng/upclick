class UpclickController < ApplicationController
  def index
    @count = Click.count
  end
  
  def new
    @click = Click.new
    @click.save
    redirect_to root_path
  end
end
