'use strict'
_ = require('underscore')

module.exports = () ->
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

  @solve = (board)->
    emptyCells = createEmptySpotsArray(board)
    i = 0
    while i < emptyCells.length
      row = emptyCells[i][0]
      col = emptyCells[i][1]
      valueToCheck = board[row][col] + 1
      found = false
      while valueToCheck < 10 and !found
        if isOkInGrid(board, row, col, valueToCheck) and isOkInRow(board, row, valueToCheck) and isOkInColumn(board, col, valueToCheck)
          board[row][col] = valueToCheck
          found = true
        else
          valueToCheck++
      if !found
        board[row][col] = 0
        i--
        console.log 'Rolling back to ', i
      else
        i++
        console.log 'Increasing to ', i

  @
