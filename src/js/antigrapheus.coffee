---
---

result = (ocrRes) ->
  console.log("Result: " + ocrRes)

process = ->
  console.log('processing')
  $('#process').toggleClass('disabled').toggleClass('btn-primary').toggleClass('btn-secondary').prop('disabled',true)
  image = document.getElementById('imageUpload').files[0]
  console.log(image)
  Tesseract.recognize(image, $('#language1').val())
    .progress((message) -> console.log(message))
    .catch((err) -> console.error(err))
    .then((result) ->
      console.log(result)
      $('#results').empty().append($('<p>').text(result.text))
    )
    .finally((resultOrError) -> console.log(resultOrError))
  return false

$(document).ready ->
  console.log('ready')
  window.Tesseract = Tesseract.create({
    workerPath: '{{ site.url }}/src/js/vendor/tesseract/worker.js',
    langPath: '{{ site.url }}/lang/'
    # corePath: '{{ site.url }}/src/js/vendor/tesseract/tesseract.js'
  })
  $('form').submit (e) ->
    process()
    e.preventDefault()
