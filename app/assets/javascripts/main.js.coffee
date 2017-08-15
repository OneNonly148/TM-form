val = 0
valTemp = ''
valSpeed = '1'
FormStat1 = 'active'
FormStat2 = ''
FormStat3 = ''
FormStat4 = ''
FormStat5 = ''
window.onload =->
  console.log "Im online"
  $(".form_2").hide()
  $(".form_3").hide()
  $(".form_4").hide()
  $(".form_5").hide()
  $(".contact").hide()
  $("#cat_1").empty()
  $("#cat_1").append("<input type='text' id='cat_1' placeholder='Category' class='form'></input>")
  $("#cat_2").empty()
  $("#cat_2").append("<input type='text' id='cat_1' placeholder='Category' class='form'></input>")
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

handleStepDisplay = () ->
  $("#steps").empty()
  $("#steps").append(
    "<td class="+FormStat1+">1 | Site Details</td>
    <td class="+FormStat2+">2 | Service Details</td>
    <td class="+FormStat3+">3 | Other Service Details</td>
    <td class="+FormStat4+">4 | Preview Quotation</td>
    <td class="+FormStat5+">5 | Quotation Summary</td>")

@handleChange = (value, data) ->
  console.log "Value: " +value+ " | Data: " +data
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

  else if value == 2
    console.log "Loading UPE 1"
    $.ajax
      url: 'load_UPE.json'
      type: 'get'
      data: val: data
      success: (result) ->
        valTemp = JSON.stringify result
        $("#cat_1").empty()
        $("#cat_1").append("<input type='text' id='cat_1' placeholder="+valTemp+"></input>")
      error: (error) ->
        console.log "Error: Loading UPE Value"
  else if value == 3
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

  else if value == 4

  else
    console.log "Error: In Handle Change"
@handleNext = (value)->
  val = value
  console.log val
  if value == 1
    #load form
    $(".form_2").show()
    $(".form_1").hide()
    FormStat1 = ''
    FormStat2 = 'active'
    $('#slide-speed').slider(
      value: 1,
      min: 0,
      max: 1000,
      step: 10,
      slide: (event, ui) ->
        if ui.value == 0
          valSpeed = 1
          $('#amount-speed').val valSpeed+ " Mbps"
        else
          $('#amount-speed').val ui.value+ " Mbps"
      )
    $('#amount-speed').val(valSpeed+ "Mbps")

    $('#slide-contract').slider(
      value: 1,
      min: 1,
      max: 5,
      step: 1,
      slide: (event, ui) ->
        $('#amount-contract').val ui.value+ " Years"
      )
    $('#amount-contract').val("1 Years")

    $('#slide-distance').slider(
      value: 0,
      min: 0,
      max: 50,
      step: 1,
      slide: (event, ui) ->
        $('#amount-distance').val ui.value+ " km"
      )
    $('#amount-distance').val("1 km")
    handleStepDisplay()
  else if value == 2
    $(".form_3").show()
    $(".form_2").hide()
    FormStat2 = ''
    FormStat3 = 'active'
    handleStepDisplay()
  else if value == 3
    $(".form_4").show()
    $(".form_3").hide()
    FormStat3 = ''
    FormStat4 = 'active'
    handleStepDisplay()
  else if value == 4
    $(".contact").dialog()

@handleSubmit = ()->
  console.log "Submitting Form"
  $(".contact").dialog("close")
  $(".form_5").show()
  $(".form_4").hide()
  FormStat4 = ''
  FormStat5 = 'active'
  handleStepDisplay()
