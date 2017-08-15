class MainController < ApplicationController
  def mainmenu
  end
  def load_state
    loads = State.all
    respond_to do |format|
      format.json { render json: loads.to_json, status: :ok }
    end
  end
  def load_UPE
    data = params["val"].to_i
    loads = Location.where(id:[data])
    respond_to do |format|
      format.json { render json: loads.to_json, status: :ok }
    end
  end
  def load_loc
    data = params["val"].to_i
    if data == 1
      loads = Location.where(id:[1..3])
    elsif data == 2
      loads = Location.where(id:[4..5])
    elsif data == 3
      loads = Location.where(id:[4..5])
    elsif data == 4
      loads = Location.where(id:[4..5])
    elsif data == 5
      loads = Location.where(id:[4..5])
    elsif data == 6
      loads = Location.where(id:[4..5])
    elsif data == 7
      loads = Location.where(id:[4..5])
    elsif data == 8
      loads = Location.where(id:[4..5])
    elsif data == 9
      loads = Location.where(id:[4..5])
    elsif data == 10
      loads = Location.where(id:[4..5])
    elsif data == 11
      loads = Location.where(id:[4..5])
    elsif data == 12
      loads = Location.where(id:[4..5])
    elsif data == 13
      loads = Location.where(id:[4..5])
    elsif data == 14
      loads = Location.where(id:[4..5])
    elsif data == 15
      loads = Location.where(id:[4..5])
    end

    respond_to do |format|
      format.json { render json: loads.to_json, status: :ok }
    end
  end
end
