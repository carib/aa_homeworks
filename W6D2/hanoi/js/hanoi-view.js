class HanoiView {
  constructor(game, rootEl) {
    this.game = game;
    this.$rootEl = rootEl;
    this.fromTower = null;
    this.setupTowers();
    
    
    this.$rootEl.click( e => {
      this.clickTower($(e.target).data('col'));
    });
  }
  
  setupTowers() {
    for (let i = 0; i < 3; i++) {
      const cols = `<ul class="col-${i}"><li class="top" data-col="${i}"></li><li class="mid" data-col="${i}"></li><li class="btm" data-col="${i}"></li></ul>`;
      this.$rootEl.append(cols);
    }
  }
  
  clickTower($tower) {
    if (this.fromTower === null) {
      this.fromTower = $tower;
    } else {
      this.game.move(this.fromTower, $tower);
      this.render();
      this.fromTower = null;
    }
  }
  
  render() {
    for (let j = 0; j < this.game.towers.length; j++) {
      let tower = $(`li[data-col='${j}']`);
      let stack = this.game.towers[j];
      for (let i = 3; i > 0; i--) {
        if(stack[i] === undefined){
          $(tower[3-i]).removeClass('one');
          $(tower[3-i]).removeClass('two');
          $(tower[3-i]).removeClass('three');
        } else if (stack[i] === 1){
          $(tower[3-i]).addClass('one');
        } else if (stack[i] === 2){
          $(tower[3-i]).addClass('two');
        } else if (stack[i] === 3){
          $(tower[3-i]).addClass('three');
        }
      }
    }
  }
}

module.exports = HanoiView;