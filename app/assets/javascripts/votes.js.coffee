# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

sortStories = ->
  $('.story-container > .stories').tsort('.votes_count', { order: 'desc'})
  

$(document).ready ->
  sortStories()

  dispatcher = new WebSocketRails(window.location.host + '/websocket')

  channel = dispatcher.subscribe('votes')
  channel.bind 'update_vote', (story) ->
    $(".votes_count[data-id=#{story.id}]").text(story.points)

    sortStories()

