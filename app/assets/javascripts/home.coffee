# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  FARMA.navBarFixed()
  FARMA.researchIcon()
  FARMA.sidebarScrollSpy()
  FARMA.tabbedResearchs()

FARMA.reloadMaterilizeEffects = ->
  Waves.displayEffect() # reinitialize wave effect on button
  $('.dropdown-button').dropdown() # reinitialize dropdown
  $('input[autofocus]').siblings('label, i').addClass('active')
  $('.parallax').parallax() # reinitialize parallax
  $('.slider').slider()

FARMA.navBarFixed = ->
  $(window).scroll ->
    if $(this).scrollTop() > 0
      $('img.logo').addClass 'nav-bar-fixed'
      $('#home-page-navba').addClass 'active'
    else
      $('img.logo').removeClass 'nav-bar-fixed'
      $('#home-page-navbar').removeClass 'active'

FARMA.researchIcon = ->
  $('#home-page-researchs .collapsible-header').click (e)->
    $('#home-page-researchs .icon-arrow i').removeClass('fa-angle-up')
    $('#home-page-researchs .icon-arrow i').addClass('fa-angle-down')

    unless ($(@).hasClass('active'))
      $(@).find('i').removeClass('fa-angle-down')
      $(@).find('i').addClass('fa-angle-up')

FARMA.sidebarScrollSpy = ->
  $('.scrollspy').scrollSpy({scrollOffset: 63})
  $('.tooltipped').tooltip({delay: 20})

FARMA.tabbedResearchs = ->
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
