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
