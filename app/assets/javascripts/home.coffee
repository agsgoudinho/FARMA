# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.FARMA.navBarFixed = ->
  $(window).scroll ->
    if $(this).scrollTop() > 0
      $('img.logo').addClass 'nav-bar-fixed'
      $('#home-page-navbar').addClass 'active'
    else
      $('img.logo').removeClass 'nav-bar-fixed'
      $('#home-page-navbar').removeClass 'active'

window.FARMA.loadMouseOverOnCard = ->
  $("#home-page-team .card").mouseenter (e) ->
    if $(@).find('> .card-reveal').length
      if $(e.target).is($('.card .activator')) || $(e.target).is($('.card .activator i'))
        # Make Reveal animate up
        car_reveal = $(@).find('.card-reveal')
        car_reveal.css({ display: 'block'})
        car_reveal.velocity("stop", false)
        car_reveal.velocity({translateY: '-100%'},
                            {duration: 300, queue: false, easing: 'easeInOutQuad'})

      $('.card-reveal').closest('.card').css('overflow', 'hidden');

  $("#home-page-team .card").mouseleave ->
    # Make Reveal animate down and display none
    $(@).find('.card-reveal').velocity {translateY: 0},
       duration: 225,
       queue: false,
       easing: 'easeInOutQuad',
       complete: ->
          $(this).css({ display: 'none'})

window.FARMA.researchIcon = ->
  $('#home-page-researchs .collapsible-header').click (e)->
    $('#home-page-researchs .icon-arrow i').html('keyboard_arrow_down')

    unless ($(@).hasClass('active'))
      $(@).find('i').html('keyboard_arrow_up')

window.FARMA.sidebarScrollSpy = ->
  $('.scrollspy').scrollSpy({scrollOffset: 600})
  $('.tooltipped').tooltip({delay: 20})

window.FARMA.tabbedResearchs = ->
  $('ul.tabs').tabs();
  $('.show-less').hide()
  $('.show-more').on 'click', ->
    $('.more').show()
    Materialize.showStaggeredList('.more')
    $('.show-more').hide()
    $('.show-less').show()
  $('.show-less').on 'click', ->
    $('.more').hide()
    $('.more').children().css('opacity', 0)
    $('.show-less').hide()
    $('.show-more').show()
