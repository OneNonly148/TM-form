val = 0
window.onload = ->
  console.log "Im online"
  #$(".form_2").hide()
  #$(".form_3").hide()
  #$(".form_4").hide()
  #$(".form_5").hide()
  if val == 0
    console.log val
    $("#steps").append('<
    <td class="active">1 | Site Details</td>
    <td >2 | Service Details</td>
    <td>3 | Other Service Details</td>
    <td>4 | Preview Quotation</td>
    <td>5 | Quotation Summary</td>')
@handleNext = (value)->
  val = value
  console.log val
  if value == 1
    $(".form_2").show()
    $(".form_1").hide()
    $("#steps").empty()
    $("#steps").append("<td>1 | Site Details</td>
                        <td class='active'>2 | Service Details</td>
                        <td>3 | Other Service Details</td>
                        <td>4 | Preview Quotation</td>
                        <td>5 | Quotation Summary</td>")
  else if value == 2
    $(".form_3").show()
    $(".form_2").hide()
    $("#steps").empty()
    $("#steps").append("<td>1 | Site Details</td>
                        <td>2 | Service Details</td>
                        <td class='active'>3 | Other Service Details</td>
                        <td>4 | Preview Quotation</td>
                        <td>5 | Quotation Summary</td>")
  else if value == 3
    $(".form_3").show()
    $(".form_2").hide()
    $("#steps").empty()
    $("#steps").append("<td>1 | Site Details</td>
                        <td>2 | Service Details</td>
                        <td class='active'>3 | Other Service Details</td>
                        <td>4 | Preview Quotation</td>
                        <td>5 | Quotation Summary</td>")
  else if value == 4
    $(".form_3").show()
    $(".form_2").hide()
    $("#steps").empty()
    $("#steps").append("<td>1 | Site Details</td>
                        <td>2 | Service Details</td>
                        <td class='active'>3 | Other Service Details</td>
                        <td>4 | Preview Quotation</td>
                        <td>5 | Quotation Summary</td>")
