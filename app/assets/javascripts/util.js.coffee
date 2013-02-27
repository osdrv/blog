window.p = () ->
  console.log(arguments)

window._c = (e) ->
  e.preventDefault()
  e.stopPropagation()

$(()->
  
  $('a[href="#"]').on('click', (e) ->
    e.preventDefault()
  )

  $('a[method]').on('click', (e) ->
    _c(e)
    a = $(this)
    konfirm = a.attr('confirm')
    cb = () ->
      $.ajax(
        type: a.attr('method'),
        url: a.attr('href'),
        dataType: 'json',
        success: (d) ->
          success = a.attr('success')
          eval(success + ".call(a, d);") if success
      )
    if konfirm
      if confirm(konfirm)
        cb()
    else
      cb()
  )

  $("a.submit").on( "click", ( e ) ->
  	_c( e )
  	$(this).closest( "form" ).submit()
  )
)