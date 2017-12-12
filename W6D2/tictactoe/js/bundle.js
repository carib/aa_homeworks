/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// identity function for calling harmony imports with the correct context
/******/ 	__webpack_require__.i = function(value) { return value; };
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 2);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports) {

class Game {
  constructor() {
    this.currentPiece = 'x';
  }
  
  playMove($square) {
    
    if (this.currentPiece === 'x') {
      $square.addClass('o');
    } else {
      $square.addClass('x');
    }
    this.swapPiece();
  }

  swapPiece() {
    if (this.currentPiece === 'x') {
      this.currentPiece = 'o';
    } else {
      this.currentPiece = 'x';
    }
  }
  
  checkWin($grid) {
    // This checks rows
    let win;
    
    const rows = ['.tp','.mid','.btm'];
    
    
    for (let i = 0; i < rows.length; i++) {

      if(this.checkSame($(rows[i]))){
        this.swapPiece();
        win = this.currentPiece;
        return win;
      }
    }
    
    // This checks columns 
    for (let i = 0; i < 3; i++) {
      if(this.checkSame($(`.col-${i} li`))){
        this.swapPiece();
        win = this.currentPiece;
        return win;
      }
    }
    
    // this checks diagonals
    const ltr = ['.col-0 .tp', '.col-1 .mid','.col-2 .btm'];
    const rtl = ['.col-0 .btm', '.col-1 .mid','.col-2 .tp'];
    
    if (this.checkSame(ltr)) {
      this.swapPiece();
      win = this.currentPiece;
      return win;
    }
    
    if (this.checkSame(rtl)) {
      this.swapPiece();
      win = this.currentPiece;
      return win;
    }
  }
  
checkSame(array) {
  const firstClass = $(array[0]).attr('class');
  if (!(firstClass.includes('o') || firstClass.includes('x'))) return false;
  
    for (let i = 0; i < array.length; i++) {
      
      let compareClass = $(array[i]).attr('class');
      compareClass = compareClass.slice(compareClass.length - 1);
      if (!(compareClass.includes('o') || compareClass.includes('x'))) return false;
      if (!(firstClass.includes(compareClass))) return false;
    }
    return true;
  }
}










module.exports = Game;

/***/ }),
/* 1 */
/***/ (function(module, exports) {

class View {
  constructor(game, $el) {
    this.game = game;
    this.$grid = $el;
    this.setupBoard();
  }

  bindEvents() {
    this.$grid.click((event) => {
      
      this.makeMove($(event.target));
    });
  }

  makeMove($square) {
    if($square.text()){
      alert('Invalid Move');
    } else {
      
      this.game.playMove($square);
      if (this.game.checkWin()) {
        alert('WIN');

      }
    }
  }

  setupBoard() {
    for (var i = 0; i < 3; i++) {
      const gridCol = `<ul class='col-${i}'><li class='tp'></li><li class='mid'></li><li class='btm'></li></ul>`;
      this.$grid.append(gridCol);
    }
    this.bindEvents();
  }
}

module.exports = View;


/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

const View = __webpack_require__(1);
const Game = __webpack_require__(0);

$( () => {
  const game = new Game();
  const $el = $('.ttt');
  const view = new View(game, $el);
});

Window.$ = $;

/***/ })
/******/ ]);