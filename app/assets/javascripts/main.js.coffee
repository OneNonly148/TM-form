val = 0
valTemp = ''
valLoc = ''
valArr = 1

dataUser = 'Steve'
dataPassword = 'foobar'
dataLogin = true
tempUser = ''
tempPassword = 'foobar'

valUname = ''
valUphone = ''
valUfax = ''
valUemail = ''

valName1  = new Array(10)
valCat1   = new Array(10)
valUPE1   = new Array(10)
valName2  = new Array(10)
valCat2   = new Array(10)
valUPE2   = new Array(10)

valSpeed      = new Array(10)
valSclass     = new Array(10)
valSlevel     = new Array(10)
valContract   = new Array(10)
valScat       = new Array(10)
valSdiscount  = new Array(10)
valStype      = new Array(10)
valSdistance  = new Array(10)

valRouter     = new Array(10)
valRbom       = new Array(10)
valRquantity  = new Array(10)
valRdiscount  = new Array(10)
valRwiring    = new Array(10)

valStatus = "Pending"

valO = 1
valM = 1
valR = 1
valMD = 1
valRD = 1
valT = 1
valTD = 1
valTDT = 1

FormStat1 = 'active'
FormStat2 = ''
FormStat3 = ''
FormStat4 = ''
FormStat5 = ''
#---------------------------------------------------------------
hideAll = ()->
  $(".form_1").hide()
  $(".form_2").hide()
  $(".form_3").hide()
  $(".form_4").hide()
  $(".form_5").hide()
  $(".contact").hide()
  $(".profile").hide()
#---------------------------------------------------------------
window.onload =->
  console.log "Im online"
  $.ajax
    url: '/stat.json'
    type: 'get'
    success: (result)->
      console.log "Check login:" +result
      if result
        hideAll()
        $(".login").hide()
        $(".profile").show()
    error: (error)->
      console.log "Error login check"
  hideAll()
  $(".nav").empty()
  $(".nav").append("<ul class='nav'><img src='http://estes-park.com/sites/all/themes/estesparktwo/images/hamburger.png' id='logo-home' onclick='handleMenu(1);'></ul>")
  $("#cat_1").empty()
  $("#cat_1").append("<input type='text' placeholder='Location Category' class='form' disabled></input>")
  $("#cat_2").empty()
  $("#cat_2").append("<input type='text' placeholder='Location Category' class='form' disabled></input>")
  handleStepDisplay()
  # #load state_1 and #state_2
  $.ajax
    url: 'load_state.json'
    type: 'get'
    success: (result) ->
      $("#state_1").empty()
      $("#state_2").empty()
      $("#loc_1").empty()
      $("#loc_2").empty()
      $("#state_1").append("<option value=0>Select State</option>")
      $("#state_2").append("<option value=0>Select State</option>")
      $("#loc_1").append("<option value=0>Select Location</option>")
      $("#loc_2").append("<option value=0>Select Location</option>")
      $.each result, (key, value) ->
        $("#state_1").append("<option value="+value.id+">"+value.name+"</option>")
        $("#state_2").append("<option value="+value.id+">"+value.name+"</option>")
    error: (error) ->
      console.log "Error: Loading States Value"
#---------------------------------------------------------------
@handleLogin = () ->
  tempUser = $("#user").val()
  tempPassword = $("#password").val()
  console.log "User: " +tempUser
  console.log "Pass: " +tempPassword
  $.ajax
    url: '/login.json'
    type: 'get'
    data:
      id: tempUser
      pass:tempPassword
    success: (result)->
      console.log "Return: " +JSON.stringify result
      if result
        console.log "Logged in"
        dataLogin = true
        hideAll()
        $(".login").hide()
        $(".profile").show()
      else
        console.log "Incorrect credentials"
    error: (error)->
      console.log "Error while login"
#---------------------------------------------------------------
@handleLogout = ()->
  console.log "Logging out"
  dataLogin = false
  hideAll()
  $(".login").show()
  handleMenu(0)
  $.ajax
    url: '/logout.json'
    type: 'get'
    success: (result)->
      console.log "Logout:" +JSON.stringify result
    error: (error) ->
      console.log "Error logout"
#---------------------------------------------------------------
@handleMenu = (value) ->
  if value == 1
    if dataLogin
      $(".nav").empty()
      $(".nav").append("<ul class='nav-full'>
        <img src='http://estes-park.com/sites/all/themes/estesparktwo/images/hamburger.png' id='logo-home' onclick='handleMenu(0);'>
        <li onclick='handleMenu(2);'>Profile</li>
        <li>User Guide</li>
        <li onclick='handleMenu(3);'>Get Quotation</li>
        <li onclick='handleLogout();'>Logout</li>
        </ul>")
    else
      $(".nav").empty()
      $(".nav").append("<ul class='nav-full'>
        <img src='http://estes-park.com/sites/all/themes/estesparktwo/images/hamburger.png' id='logo-home' onclick='handleMenu(0);'>
        <li>User Guide</li>
        <li>Location List</li>
        </ul>")
  else if value == 2
    hideAll()
    $(".profile").show()
  else if value == 3
    hideAll()
    $(".form_1").show()
  else
    $(".nav").empty()
    $(".nav").append("<ul class='nav'><img src='http://estes-park.com/sites/all/themes/estesparktwo/images/hamburger.png' id='logo-home' onclick='handleMenu(1);'></ul>")
#---------------------------------------------------------------
handleStepDisplay = () ->
  $("#steps").empty()
  $("#steps").append(
    "<td class="+FormStat1+">1 | Site Details</td>
    <td class="+FormStat2+">2 | Service Details</td>
    <td class="+FormStat3+">3 | Other Service Details</td>")
#---------------------------------------------------------------
determineUPE = (val) ->
  console.log "Determining UPE:" +val
  if val == '1'
    "Dedicated"
  else if val == '2'
    "Shared"
  else if val == '3'
    "-"
#---------------------------------------------------------------
determineClass = (val) ->
  console.log "Determining Class:" +val
  if val == '1'
    "Multimedia"
  else if val == '2'
    "Mission Critical"
  else if val == '3'
    "Standard Data"
  else if val == '4'
    "Economy"
#---------------------------------------------------------------
determineSlevel = (val) ->
  console.log "Determining Level:" +val
  if val == '1'
    "SLA 99.0"
  else if val == '2'
    "SLG 99.5"
  else if val == '3'
    "SLG 99.7"
  else if val == '4'
    "SLG 99.9"
  else if val == '5'
    "SLG 99.99"
  else if val == '6'
    "SLG 99.997"
#---------------------------------------------------------------
determineLink = (val) ->
  console.log "Determining Link:" +val
  if val == '1'
    "Intra Metro"
  else if val == '2'
    "Inter Metro"
  else if val == '3'
    "Inter Region"
#---------------------------------------------------------------
handleCalculation = ->
  w = valRwiring[valArr]
  valOd = (10000+(valRquantity[valArr]*1250)+(1*w))
  valO = valOd.toFixed(2)
  console.log "valO: " +valO

  console.log "valSlevel: " +valSlevel[valArr]
  if valSlevel[valArr] > 0 && valSlevel[valArr] < 4
    SL = 1
  else if valSlevel[valArr] > 3 && valSlevel[valArr] < 6
    SL = 2

  console.log "valUPE1: " +valUPE1[valArr]+ " valCont: " +valContract[valArr]
  if valUPE1[valArr] == '1'
    if valContract[valArr] > 0 && valContract[valArr] < 4
        UPE1 = 2799.96
    else if valContract[valArr] > 3 && valContract[valArr] < 6
        UPE1 = 1820.04
  else if valUPE1[valArr] == '2'
    if valContract[valArr] > 0 && valContract[valArr] < 4
        UPE1 = 13950
    else if valContract[valArr] > 3 && valContract[valArr] < 6
        UPE1 = 9159.96
  else
    UPE1 = 0

  console.log "valUPE2: " +valUPE2[valArr]+ " valCont: " +valContract[valArr]
  if valUPE2[valArr] == '1'
    if valContract[valArr] > 0 && valContract[valArr] < 4
        UPE2 = 2799.96
    else if valContract[valArr] > 3 && valContract[valArr] < 6
        UPE2 = 1820.04
  else if valUPE2[valArr] == '2'
    if valContract[valArr] > 0 && valContract[valArr] < 4
        UPE2 = 13950
    else if valContract[valArr] > 3 && valContract[valArr] < 6
        UPE2 = 9159.96
  else
    UPE2 = 0
  valTUPE = ((SL*UPE1)+(SL*UPE2))/12
  console.log "SL: " +SL+ " UPE1: " +UPE1+ " UPE2: " +UPE2+ " TUPE: " +valTUPE

  S = (valSpeed[valArr]*7150)+38090
  console.log "Speed: " +S

  console.log "valSlevel: " +valSlevel[valArr]+ " valSlevel: " +valSclass[valArr]
  if valSlevel[valArr] == '1'
    if valSclass[valArr] == '1'
      P = 1.5
    else if valSclass[valArr] == '2'
      P = 1.2
    else if valSclass[valArr] == '3'
      P = 1
    else if valSclass[valArr] == '4'
      P = 0.92
  else if valSlevel[valArr] == '2'
    if valSclass[valArr] == '1'
      P = 1.95
    else if valSclass[valArr] == '2'
      P = 1.56
    else if valSclass[valArr] == '3'
      P = 1.3
    else if valSclass[valArr] == '4'
      P = 1.2
  else if valSlevel[valArr] == '3'
    if valSclass[valArr] == '1'
      P = 2.1
    else if valSclass[valArr] == '2'
      P = 1.68
    else if valSclass[valArr] == '3'
      P = 1.4
    else if valSclass[valArr] == '4'
      P = 1.29
  else if valSlevel[valArr] == '4'
    if valSclass[valArr] == '1'
      P = 2.25
    else if valSclass[valArr] == '2'
      P = 1.8
    else if valSclass[valArr] == '3'
      P = 1.5
    else if valSclass[valArr] == '4'
      P = 1.38
  else if valSlevel[valArr] == '5'
    if valSclass[valArr] == '1'
      P = 2.7
    else if valSclass[valArr] == '2'
      P = 2.16
    else if valSclass[valArr] == '3'
      P = 1.8
    else if valSclass[valArr] == '4'
      P = 1.66
  else if valSlevel[valArr] == '6'
    if valSclass[valArr] == '1'
      P = 2.85
    else if valSclass[valArr] == '2'
      P = 2.28
    else if valSclass[valArr] == '3'
      P = 1.9
    else if valSclass[valArr] == '4'
      P = 1.75

  console.log "valContract: " +valContract[valArr]
  if valContract[valArr] == 1
    PC = 1.3
  else if valContract[valArr] == 2
    PC = 1.15
  else if valContract[valArr] == 3
    PC = 1
  else if valContract[valArr] == 4
    PC = .93
  else if valContract[valArr] == 5
    PC = .85

  console.log "valCat1: " +valCat1[valArr]
  if valCat1[valArr] == "CBA"
    C1 = 1
  else if valCat1[valArr] == "Non CBA"
    C1 = 1.1
  else if valCat1[valArr] == "Non CBA 2"
    C1 = 1.2

  console.log "valCat2: " +valCat2[valArr]
  if valCat1[valArr] == "CBA"
    C2 = 1
  else if valCat1[valArr] == "Non CBA"
    C2 = 1.1
  else if valCat1[valArr] == "Non CBA 2"
    C2 = 1.2
  console.log "P: " +P+ " PC: " +PC+ " C1: " +C1+ " C2: " +C2
  valTBW = ((S*P*PC*2*C1)+(S*P*PC*2*C2))/12
  console.log "valTBW: " +valTBW

  console.log "valScat: " +valScat[valArr]
  if valScat[valArr] == '1'
    L = 0
  else if valScat[valArr] == '2'
    L = 200
  else if valScat[valArr] == '3'
    L = 250

  valIM = 2*S*L
  console.log "valIM: " +valIM

  if valStype[valArr] == '1'
    T = 10000
  else if valStype[valArr] == '2'
    T = 2000

  valAdd = T*valSdistance[valArr]/12
  console.log "valAdd: " +valAdd
  valMd = valAdd + valIM + valTBW + valTUPE
  valM = valMd.toFixed(2)
  console.log "valIM: " +valIM

  if valRouter[valArr] == '1'
    R = 351
  else if valRouter[valArr] == '2'
    R = 351
  else if valRouter[valArr] == '3'
    R = 351
  valRd = R*valRquantity[valArr]
  valR = valRd.toFixed(2)
  console.log "valR: " +valR
  valTd = valRd + valMd + valOd
  valT = valTd.toFixed(2)
  valMDd = valM-(valM*(valSdiscount[valArr]/100))
  valMD = valMDd.toFixed(2)
  valRDd = valR-(valR*(valRdiscount[valArr]/100))
  valRD = valRDd.toFixed(2)
  valTd = valMd + valRd
  valT = valTd.toFixed(2)
  valTDd = valMD*1 + 1*valRD
  valTD = valTDd.toFixed(2)
  valTDTd = valTD*0.6 + 1*valTD
  valTDT = valTDTd.toFixed(2)

#---------------------------------------------------------------
@handleCancel = () ->
  hideAll()
  $(".profile").show()
#---------------------------------------------------------------
@handleChange = (value, data) ->
  console.log "Value: " +value+ " | Data: " +data
  #---------------------------------------------------------------
  if value == 1
    console.log "Loading Location 1"
    $.ajax
      url: 'load_loc.json'
      type: 'get'
      data: val: data
      success: (result) ->
        $("#loc_1").empty()
        $("#loc_1").append("<option value=0>Select Location</option>")
        $.each result, (key, value) ->
          $("#loc_1").append("<option value="+value.id+">"+value.name+"</option>")
      error: (error) ->
        console.log "Error: Loading Locations Value"
  #---------------------------------------------------------------
  else if value == 2
    console.log "Loading UPE 1"
    $.ajax
      url: 'load_UPE.json'
      type: 'get'
      data: val: data
      success: (result) ->
        $("#cat_1").empty()
        $.each result, (key,value) ->
          console.log "Category: " +value.category
          valTemp = JSON.stringify value.category
          $("#cat_1").append("<input type='text' id='tcat_1' value="+valTemp+" class='form' disabled></input>")
      error: (error) ->
        console.log "Error: Loading UPE Value"
  #---------------------------------------------------------------
  else if value == 3
    console.log "Loading Location 2"
    $.ajax
      url: 'load_loc.json'
      type: 'get'
      data: val: data
      success: (result) ->
        $("#loc_2").empty()
        $("#loc_2").append("<option value=0>Select Location</option>")
        $.each result, (key, value) ->
          $("#loc_2").append("<option value="+value.id+">"+value.name+"</option>")
      error: (error) ->
        console.log "Error: Loading Locations Value"
  #---------------------------------------------------------------
  else if value == 4
    console.log "Loading UPE 2"
    $.ajax
      url: 'load_UPE.json'
      type: 'get'
      data: val: data
      success: (result) ->
        $("#cat_2").empty()
        $.each result, (key,value) ->
          console.log "Category: " +value.category
          valTemp = JSON.stringify value.category
          $("#cat_2").append("<input type='text' id='tcat_2' value="+valTemp+" class='form' disabled></input>")
      error: (error) ->
        console.log "Error: Loading UPE Value"
  #---------------------------------------------------------------
  else
    console.log "Error: In Handle Change"
#---------------------------------------------------------------
@handleNext = (value)->
  val = value
  console.log val
  #---------------------------------------------------------------
  if value == 1
    if valLoc == 1
      $(".form_1").dialog("close")
      $(".form_2").dialog({ height: 800, width:1000 })
    else
      $(".form_2").show()
      $(".form_1").hide()
      FormStat1 = ''
      FormStat2 = 'active'
    valName1[valArr] = $("#name_1").val()
    valCat1[valArr] = $("#tcat_1").val()
    valUPE1[valArr] = $("#UPE_1").val()
    valName2[valArr] = $("#name_2").val()
    valCat2[valArr] = $("#tcat_2").val()
    valUPE2[valArr] = $("#UPE_2").val()
    console.log "Name 1:" +valName1[valArr]+ " | Category 1:" +valCat1[valArr]+ " | UPE 1:" +valUPE1[valArr]+ " | Name 2:" +valName2[valArr]+ " | Category 2:" +valCat2[valArr]+ " | UPE 2:" +valUPE2[valArr]
    valSpeed[valArr] = 1
    valContract[valArr] = 1
    valSdistance[valArr] = 1
    $('#slide-speed').slider(
      value: 1,
      min: 0,
      max: 1000,
      step: 10,
      slide: (event, ui) ->
        if ui.value == 0
          valSpeed[valArr] = 1
          $('#amount-speed').val valSpeed[valArr]+ " Mbps"
        else
          valSpeed[valArr] = ui.value
          $('#amount-speed').val ui.value+ " Mbps"
      )
    $('#amount-speed').val("1 Mbps")

    $('#slide-contract').slider(
      value: 1,
      min: 1,
      max: 5,
      step: 1,
      slide: (event, ui) ->
        valContract[valArr] = ui.value
        $('#amount-contract').val ui.value+ " Years"
      )
    $('#amount-contract').val("1 Years")

    $('#slide-distance').slider(
      value: 0,
      min: 0,
      max: 50,
      step: 1,
      slide: (event, ui) ->
        valSdistance[valArr] = ui.value
        $('#amount-distance').val ui.value+ " km"
      )
    $('#amount-distance').val("1 km")
    handleStepDisplay()
  #---------------------------------------------------------------
  else if value == 2
    if valLoc == 1
      $(".form_2").dialog("close")
      $(".form_3").dialog({ height: 500, width:1000 })
    else
      $(".form_3").show()
      $(".form_2").hide()
      FormStat2 = ''
      FormStat3 = 'active'
    valSclass[valArr]    = $("#s_class").val()
    valSlevel[valArr]    = $("#s_level").val()
    valScat[valArr]      = $("#i_link").val()
    valSdiscount[valArr] = $("#s_discount").val()
    valStype[valArr]     = $("#s_type").val()
    console.log "Speed:" +valSpeed[valArr]+ " | Class:" +valSclass[valArr]+ " | Level:" +valSlevel[valArr]+ " | Contract:" +valContract[valArr]+ " | Link:" +valScat[valArr]+ " | Discount:" +valSdiscount[valArr]+ " | Type: " +valStype[valArr]+ " | Distance: " +valSdistance[valArr]
    handleStepDisplay()
  #---------------------------------------------------------------
  else if value == 3
    valRouter[valArr]     = $("#router").val()
    valRbom[valArr]       = $("#R_BOM").val()
    valRquantity[valArr]  = $("#R_Quantity").val()
    valRdiscount[valArr]  = $("#R_Discount").val()
    valRwiring[valArr]    = $("#R_Wiring").val()
    console.log "Router:" +valRouter[valArr]+ " | BOM:" +valRbom[valArr]+ " | Quantity:" +valRquantity[valArr]+ " | Discount:" +valRdiscount[valArr]+ " | Wiring:" +valRwiring[valArr]
    $(".contact").dialog()
#---------------------------------------------------------------
@handleLocation = () ->
  console.log "Adding Location"
  valLoc = 1
  valArr += 1
  console.log "Array Index:" +valArr
  $(".form_1").dialog({ height: 500, width:1000 })
#---------------------------------------------------------------
@handleSubmit = (value)->
  if value == 1
    console.log "Calculating"
    handleCalculation()
    console.log "Submitting Form"
    valUname = $("#fv_name").val()
    valUphone = $("#fv_phone").val()
    valUfax = $("#fv_fax").val()
    valUemail = $("#fv_email").val()
    $(".contact").dialog("close")
    $(".form_4").show()
    $(".form_3").hide()
    FormStat3 = ''
    FormStat1 = 'active'
    handleStepDisplay()
    $("#f_O").empty()
    $("#f_O").append(valO)
    $("#f_M").empty()
    $("#f_M").append(valM)
    $("#f_R").empty()
    $("#f_R").append(valR)
    $("#f_MD").empty()
    $("#f_MD").append(valMD)
    $("#f_RD").empty()
    $("#f_RD").append(valRD)
    $("#f_T").empty()
    $("#f_T").append(valT)
    $("#f_TD").empty()
    $("#f_TD").append(valTD)
    $("#f_TDT").empty()
    $("#f_TDT").append(valTDT)
    $("#f_name").empty()
    $("#f_name").append(valUname)
    $("#f_phone").empty()
    $("#f_phone").append(valUphone)
    $("#f_fax").empty()
    $("#f_fax").append(valUfax)
    $("#f_email").empty()
    $("#f_email").append(valUemail)
    $(".notif").append("<h1 id='success'>Form Submitted</h1>")
  else if value == 2
    $(".form_4").hide()
    $(".profile").show()
    $.ajax
      url: '/id.json'
      type: 'get'
      success: (result) ->
        $.ajax
          url: '/submit_data.json'
          type: 'get'
          data:
            valID: JSON.stringify result
            valUname: valUname
            valUphone: valUphone
            valUfax: valUfax
            valUemail: valUemail
            valName1: valName1[valArr]
            valCat1: valCat1[valArr]
            valUPE1: valUPE1[valArr]
            valName2: valName2[valArr]
            valCat2: valCat2[valArr]
            valUPE2: valUPE2[valArr]
            valSpeed: valSpeed[valArr]
            valSclass: valSclass[valArr]
            valSlevel: valSlevel[valArr]
            valContract: valContract[valArr]
            valScat: valScat[valArr]
            valSdiscount: valSdiscount[valArr]
            valStype: valStype[valArr]
            valSdistance: valSdistance[valArr]
            valRouter: valRouter[valArr]
            valRbom: valRbom[valArr]
            valRquantity: valRquantity[valArr]
            valRdiscount: valRdiscount[valArr]
            valRwiring: valRwiring[valArr]

            valStatus: 'Pending'

    $(".table-location").append("<tr><td>1</td>
    <td>"+valName1[valArr]+"</td>
    <td>"+valCat1[valArr]+"</td>
    <td>"+valUPE1[valArr]+"</td>
    <td>"+valName2[valArr]+"</td>
    <td>"+valCat2[valArr]+"</td>
    <td>"+valUPE2[valArr]+"</td>
    <td>"+valSpeed[valArr]+"</td>
    <td>"+valSclass[valArr]+"</td>
    <td>"+valSlevel[valArr]+"</td>
    <td>"+valContract[valArr]+"</td>
    <td>"+valStatus+"</td>
    </tr>")
