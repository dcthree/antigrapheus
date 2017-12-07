---
---

result = (ocrRes) ->
  console.log("Result: " + ocrRes)

toggleProcess = ->
  $('#process').toggleClass('disabled').toggleClass('btn-primary').toggleClass('btn-secondary').prop('disabled',!$('#process').prop('disabled'))

process = ->
  console.log('processing')
  toggleProcess()
  image = document.getElementById('imageUpload').files[0]
  console.log(image)
  Tesseract.recognize(image, $('#language1').val())
    .progress((message) ->
      console.log(message)
      $('#progresstext').text(message.status)
      $('#progress').prop('aria-valuenow',message.progress)
      $('#progress').prop('style','width: ' + Math.round(message.progress * 100) + '%')
    )
    .catch((err) -> console.error(err))
    .then((result) ->
      console.log(result)
      $('#progresstext').text('Done!')
      $('#results').empty().append($('<p>').text(result.text))
      if $('#copy').prop('disabled')
        $('#copy').toggleClass('disabled').toggleClass('btn-outline-secondary').toggleClass('btn-outline-primary').prop('disabled',false)
      $('html, body').animate({scrollTop: $("#copy").offset().top},500)
    )
    .finally((resultOrError) -> console.log(resultOrError))
  return false

$(document).ready ->
  console.log('ready')
  window.Tesseract = Tesseract.create({
    workerPath: '{{ site.url }}{{ site.baseurl }}/src/js/vendor/tesseract/worker.js',
    langPath: '{{ site.url }}{{ site.baseurl }}/lang/'
    # corePath: '{{ site.url }}{{ site.baseurl }}/src/js/vendor/tesseract/tesseract.js'
  })
  clipboard = new Clipboard('#copy')
  clipboard.on 'success', (e) ->
    $('#copy').tooltip('show')
    setTimeout ( -> $('#copy').tooltip('hide') ), 2000
    e.clearSelection()
  $('#imageUpload').change ->
    if $('#process').prop('disabled')
      toggleProcess()
  $('form').submit (e) ->
    process()
    e.preventDefault()
