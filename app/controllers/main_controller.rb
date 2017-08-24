class MainController < ApplicationController
  $logged_in = false
  def login
    id = params["id"]
    pass = params["pass"]
    user = User.find_by(email:[id])
    $user_id = user.id
    if user.authenticate(pass)
      $logged_in = true
      current_user = $logged_in
    else
      $logged_in = false
      current_user = $logged_in
    end
    respond_to do |format|
      format.json { render json: current_user.to_json, status: :ok }
    end
  end

  def user_stat
    log = $logged_in
    respond_to do |format|
      format.json { render json: log.to_json, status: :ok }
    end
  end

  def logout
    user = nil
    $logged_in = false
    log = $logged_in
    respond_to do |format|
      format.json { render json: log.to_json, status: :ok }
    end
  end

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
      loads = Location.where(id:[6..7])
    elsif data == 4
      loads = Location.where(id:[8])
    elsif data == 5
      loads = Location.where(id:[9..10])
    elsif data == 6
      loads = Location.where(id:[11..12])
    elsif data == 7
      loads = Location.where(id:[13..15])
    elsif data == 8
      loads = Location.where(id:[16..17])
    elsif data == 9
      loads = Location.where(id:[18..19])
    elsif data == 10
      loads = Location.where(id:[20..21])
    elsif data == 11
      loads = Location.where(id:[22])
    elsif data == 12
      loads = Location.where(id:[23..25])
    elsif data == 13
      loads = Location.where(id:[26])
    elsif data == 14
      loads = Location.where(id:[27..29])
    elsif data == 15
      loads = Location.where(id:[30])
    end
    respond_to do |format|
      format.json { render json: loads.to_json, status: :ok }
    end
  end

  def save_data
    valUname = params["valUname"]
    valUphone = params["valUphone"]
    valUfax = params["valUfax"]
    valUemail = params["valUemail"]
    valName1 = params["valName1"]
    valCat1 = params["valCat1"]
    valUPE1 = params["valUPE1"]
    valName2 = params["valName2"]
    valCat2  = params["valCat2"]
    valUPE2 = params["valUPE2"]
    valSpeed = params["valSpeed"]
    valSclass = params["valSclass"]
    valSlevel = params["valSlevel"]
    valContract = params["valContract"]
    valScat = params["valScat"]
    valSdiscount = params["valSdiscount"]
    valStype = params["valStype"]
    valSdistance = params["valSdistance"]
    valRouter = params["valRouter"]
    valRbom = params["valRbom"]
    valRquantity = params["valRquantity"]
    valRdiscount = params["valRdiscount"]
    valRwiring = params["valRwiring"]
    @save = Quote.new()
  end
end
