$(() ->
  scroll_lock = false
  $("body.admin textarea").bind( "focus", () ->
    scroll_lock = true
  ).bind( "blur", () ->
    scroll_lock = false
  )
  $("body.admin").bind( "mousewheel", ( e ) ->
    _c( e ) if scroll_lock
  )
)