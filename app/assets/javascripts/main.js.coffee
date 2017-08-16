val = 0
valTemp = ''
valLoc = ''
valArr = 1

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

FormStat1 = 'active'
FormStat2 = ''
FormStat3 = ''
FormStat4 = ''
FormStat5 = ''
#---------------------------------------------------------------
window.onload =->
  console.log "Im online"
  $(".form_2").hide()
  $(".form_3").hide()
  $(".form_4").hide()
  $(".form_5").hide()
  $(".contact").hide()
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
handleStepDisplay = () ->
  $("#steps").empty()
  $("#steps").append(
    "<td class="+FormStat1+">1 | Site Details</td>
    <td class="+FormStat2+">2 | Service Details</td>
    <td class="+FormStat3+">3 | Other Service Details</td>
    <td class="+FormStat4+">4 | Preview Quotation</td>
    <td class="+FormStat5+">5 | Quotation Summary</td>")
  $("#steps2").empty()
  $("#steps2").append(
    "<td class="+FormStat1+">1 | Site Details</td>
    <td class="+FormStat2+">2 | Service Details</td>
    <td class="+FormStat3+">3 | Preview Quotation</td>
    <td class="+FormStat4+">4 | Quotation Summary</td>")
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
    if valLoc == 1
      $(".form_3").dialog("close")
    else
      $(".form_4").show()
      $(".form_3").hide()
      FormStat3 = ''
      FormStat4 = 'active'
    valRouter[valArr]    = $("#router").val()
    valRbom[valArr]      = $("#R_BOM").val()
    valRquantity[valArr] = $("#R_Quantity").val()
    valRdiscount[valArr] = $("#R_Discount").val()
    valRwiring[valArr]   = $("#R_Wiring").val()
    console.log "Router:" +valRouter[valArr]+ " | BOM:" +valRbom[valArr]+ " | Quantity:" +valRquantity[valArr]+ " | Discount:" +valRdiscount[valArr]+ " | Wiring:" +valRwiring[valArr]
    handleStepDisplay()
    $(".table-location").append(
      "<tr>
          <td>"+valArr+"</th>
          <td>"+valName1[valArr]+"</th>
          <td>"+valCat1[valArr]+"</th>
          <td>"+determineUPE(valUPE1[valArr])+"</th>
          <td>"+valName2[valArr]+"</th>
          <td>"+valCat2[valArr]+"</th>
          <td>"+determineUPE(valUPE2[valArr])+"</th>
          <td>"+valSpeed[valArr]+" Mbps</th>
          <td>"+determineClass(valSclass[valArr])+"</td>
          <td>"+determineSlevel(valSlevel[valArr])+"</th>
          <td>"+valContract[valArr]+ " Years</th>
          <td>"+determineLink(valScat[valArr])+"</th>
          <td>"+valSdiscount[valArr]+" %</th>
      </tr>"
    )
  #---------------------------------------------------------------
  else if value == 4
    $(".contact").dialog()
#---------------------------------------------------------------
@handleLocation = () ->
  console.log "Adding Location"
  valLoc = 1
  valArr += 1
  console.log "Array Index:" +valArr
  $(".form_1").dialog({ height: 500, width:1000 })
#---------------------------------------------------------------
@handleSubmit = ()->
  console.log "Submitting Form"
  valUname = $("#fv_name").val()
  valUphone = $("#fv_phone").val()
  valUfax = $("#fv_fax").val()
  valUemail = $("#fv_email").val()
  $(".contact").dialog("close")
  $(".form_5").show()
  $(".form_4").hide()
  FormStat4 = ''
  FormStat5 = 'active'
  handleStepDisplay()
  $("#f_name").append(valUname)
  $("#f_phone").append(valUphone)
  $("#f_fax").append(valUfax)
  $("#f_email").append(valUemail)
