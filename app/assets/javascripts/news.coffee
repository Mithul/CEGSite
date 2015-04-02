# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  nt_example1 = $('#nt-example1').newsTicker(
	  row_height: 80
	  max_rows: 3
	  duration: 4000
	  prevButton: $('#nt-example1-prev')
	  nextButton: $('#nt-example1-next'))

  nt_example2 = $('#bottom-ticker').newsTicker(
	  row_height: 20
	  max_rows: 1
	  duration: 4000)
  return
