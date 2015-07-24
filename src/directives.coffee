$ = require('jquery')

sudokuSolver.directive "goToNextInput", ->
  (scope, elm, attr) ->
    $(elm).on('keyup', ()->
      $(this).parent().next().find('input').focus()
      #inputs.eq( inputs.index(this)+ 1 ).focus()
    )