# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

sortStories = ->
  $('.story-container > .stories').tsort('.votes_count', { order: 'desc'}).each (i, story) ->
    $(story).css({ position: 'absolute' })
    $(story).animate {top: i * window.lineHeight }, 750 

$(document).ready ->
  window.lineHeight = 0
  $container = $('.story-container')
  $container.css position:'relative', height: $container.height(), display:'block'

  $stories = $('.story-container > .stories')

  $stories.each (index, story) ->
    posY = $(story).position().top
    console.log(posY)

    $(story).css({ top: posY })

    if(index == 1)
      window.lineHeight = posY

  sortStories()

  dispatcher = new WebSocketRails(window.location.host + '/websocket')

  channel = dispatcher.subscribe('votes')
  channel.bind 'update_vote', (story) ->
    $(".votes_count[data-id=#{story.id}]").text(story.points)

    sortStories()

