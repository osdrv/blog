$(() ->
  $("body.admin textarea").bind( "mousewheel", ( e ) ->
    _e.stopPropagation()
  )
)