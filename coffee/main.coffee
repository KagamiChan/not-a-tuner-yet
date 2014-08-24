define (require, exports, module) ->
  console.log '-_-'

  scroll_to = (name, set_hash = false) ->
    target = $("#{name}")
    if not target[0]?
      target = $('#visualizer')
    target.animatescroll
      onScrollEnd: ->
        if set_hash
          window.location.hash = name

  $(window).on 'hashchange', ->
    scroll_to window.location.hash

  $(document).ready ->
    Processor = require './processor'
    console.log Processor.is_valid()

    processor = new Processor()
    #processor.use_audio "/audio/nocturne_with_no_moon.mp3"
    processor.use_audio "/audio/Guitar_Standard_Tuning.ogg"

    $("#show-content").click ->
      scroll_to '#content', true

    canvas = $("#wave canvas")
    outer_circle = $("#outer-circle")
    inner_circle = $("#inner-circle")
    Visualizer = require './visualizer'
    vis = new Visualizer(canvas, inner_circle, outer_circle)
    vis.bind processor
