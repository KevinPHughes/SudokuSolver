angular = require('angular');

window.sudokuSolver = angular.module('sudokuSolver', [])
  .controller('MainController', require('./mainController.coffee'))
  .service('sudokuService', require('./sudokuService.coffee'))


require('./directives.coffee')