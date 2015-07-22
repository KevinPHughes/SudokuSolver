'use strict'
_ = require('underscore')

module.exports = () ->
    @board = []

    board = '050206008,100403005,600000000,090800007,803000902,700009060,000000001,500604003,900501020'
    board = board.split(',')
    board.forEach (row, index) =>
      @board[index] = row.split('').map(Number)


    @showSudoku = ->
      console.log("Here i am!")

      createEmptySpotsArray = (board) ->
        emptyCells = []
        row = 0
        while row < board.length
          column = 0
          while column < board[row].length
            if board[row][column] == 0
              emptyCells.push [
                row
                column
              ]
            column++
          row++
        emptyCells

      isOkInGrid = (board, row, col, value) ->
        rowBorder = 0
        columnBorder = 0
        if row > 2
          while row % 3 != 0
            row--
          rowBorder = row
        if col > 2
          while col % 3 != 0
            col--
          columnBorder = col
        #console.log("Row " +  rowBorder + ". Column " + columnBorder)
        r = rowBorder
        while r < rowBorder + 3
          c = columnBorder
          while c < columnBorder + 3
            if board[r][c] == value
              return false
            c++
          r++
        true

      isOkInRow = (board, row, value) ->
        c = 0
        while c < 9
          if board[row][c] == value
            return false
          c++
        true

      isOkInColumn = (board, col, value) ->
        r = 0
        while r < 9
          if board[r][col] == value
            return false
          r++
        true

      #iterate through each empty spot
      #set it to 1
      #check to see if it's ok in the 3x3 grid, the column and the row
      #if it's good, go to next empty spot and continue
      #if it's not good, increase the value until it's 9, then reset it to 0 and go back to the last open position and increase its value
      emptyCells = createEmptySpotsArray(@board)
      i = 0
      while i < emptyCells.length
        row = emptyCells[i][0]
        col = emptyCells[i][1]
        valueToCheck = @board[row][col] + 1
        found = false
        while valueToCheck < 10 and !found
          if isOkInGrid(@board, row, col, valueToCheck) and isOkInRow(@board, row, valueToCheck) and isOkInColumn(@board, col, valueToCheck)
            @board[row][col] = valueToCheck
            found = true
          else
            valueToCheck++
        if !found
          @board[row][col] = 0
          i--
          console.log 'Rolling back to ', i
        else
          i++
          console.log 'Increasing to ', i

    @
