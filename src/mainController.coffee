'use strict'
_ = require('underscore')

module.exports = (sudokuService) ->
    @board = []
    @transformStringToBoardArray = (board)->
      board = board.split(',')
      board.forEach (row, index) =>
        @board[index] = row.split('').map(Number)

    @showSudoku = ->
      start = new Date()
      sudokuService.solve(@board)
      console.log("Finished in #{new Date() - start} ms")

    @resetBoard = ->
      board = '000000000,000000000,000000000,000000000,000000000,000000000,000000000,000000000,000000000'
      @transformStringToBoardArray(board)

    board = '050206008,100403005,600000000,090800007,803000902,700009060,000000001,500604003,900501020'
    @transformStringToBoardArray(board)

    @
