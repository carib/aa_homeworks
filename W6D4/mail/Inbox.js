class Inbox {
  constructor() {}
  
  render() {
    let node = document.createElement('ul');
    node.className = 'messages';
    node.innerHTML = 'An Inbox Message';
    return node;
  }
}

module.exports = Inbox;