var TIMEOUT_COLOR = "blue";
var INTERVAL_COLOR = "yellow";
var MARKER_HOLDER_ID = "timer_marker_holder";
var MARKER_ID_PREFFIX = "timer_marker_";

( function( w ) {
  
  document.addEventListener( "DOMContentLoaded", function() {

    var _window_set_timeout = w.setTimeout;
    var _window_clear_timeout = w.clearTimeout;
    var _window_set_interval = w.setInterval;
    var _window_clear_interval = w.clearInterval;
    
    var marker_pool = {};
    var marker_holder = document.createElement( "div" );
    marker_holder.id = MARKER_HOLDER_ID;
    document.body.appendChild( marker_holder );

    var addMarker = function ( color, label ) {
      var marker_id = MARKER_ID_PREFFIX + Math.floor( Math.random() * 1E10 );
      var marker = document.createElement( "div" );
      marker.classList.add( color );
      marker.innerHTML = label;
      marker.id = marker_id;
      marker_holder.appendChild( marker );
      return marker_id;
    }

    var removeMarker = function( timer_id ) {
      if ( marker_pool[ timer_id ] !== undefined ) {
        var marker = document.getElementById( marker_pool[ timer_id ] );
        if ( marker !== null ) {
          var parent = marker.parentElement || marker.parentNode;
          parent.removeChild( marker );
          delete marker_pool[ timer_id ];
        }
      }
    }

    w.setTimeout = function( handler, timeout ) {
      var timer_id = _window_set_timeout( handler, timeout );
      var marker_id = addMarker( TIMEOUT_COLOR, "timer #" + timer_id + " for " + timeout + "ms" );
      marker_pool[ timer_id ] = marker_id;
      ( function( tid, mid) {
        _window_set_timeout( function() {
          removeMarker( tid );
        }, timeout );
      } )( timer_id, marker_id );
      return timer_id;
    }

    w.clearTimeout = function( timer_id ) {
      _window_clear_timeout( timer_id );
    }

    w.setInterval = function( handler, timeout ) {
      var interval_id = _window_set_interval( handler, timeout );
      var marker_id = addMarker( INTERVAL_COLOR, "periodic timer #" + interval_id + " for " + timeout + "ms" );
      marker_pool[ interval_id ] = marker_id;
      return interval_id;
    }

    w.clearInterval = function( interval_id ) {
      _window_clear_interval( interval_id );
      removeMarker( interval_id );
    }

    var marker_style = document.createElement( "style" );
    marker_style.type = "text/css";
    marker_style.innerHTML = " \
      #" + MARKER_HOLDER_ID + " { position: absolute;top: 0;left: 0;z-index: 100; } \n\
      #" + MARKER_HOLDER_ID + " .yellow, #timer_marker_holder .red, #timer_marker_holder .blue, #timer_marker_holder .green { height: 14px;border-radius: 7px;margin: 2px;padding: 3px;font-size: 10px;color: #FFF;float: left;font-family: 'PT Sans'; } \n\
      #" + MARKER_HOLDER_ID + " .yellow { background-color: rgba( 255, 255, 0, 0.5 ); color: #000; } \n\
      #" + MARKER_HOLDER_ID + " .red { background-color: rgba( 255, 0, 0, 0.5 ); } \n\
      #" + MARKER_HOLDER_ID + " .green { background-color: rgba( 0, 255, 0, 0.5 ); } \n\
      #" + MARKER_HOLDER_ID + " .blue { background-color: rgba( 0, 0, 255, 0.5 ); } \n\
    ";
    document.head.appendChild( marker_style );

  } );

} )( window );

