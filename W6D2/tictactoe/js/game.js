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