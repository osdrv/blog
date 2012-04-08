$(() ->
  $("body.admin textarea").bind( "mousewheel", ( e ) ->
    e.stopPropagation()
  )
)