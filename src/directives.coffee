$ = require('jquery')

sudokuSolver.directive "goToNextInput", ->
  (scope, elm, attr) ->
    $(elm).on('keyup', ()->
      return if event.keyCode == 9 || event.keyCode == 16 || event.keyCode == 8
      $(this).parent().next().find('input').focus().select()
    )