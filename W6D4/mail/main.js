const Router = require('./router.js');
const Inbox = require('./inbox.js')
document.addEventListener("DOMContentLoaded", function() {
  document.querySelectorAll('.sidebar-nav').forEach( (el) => {
    el.addEventListener('click', (e) => {
      let innerText = e.target.innerText;
      window.location.hash = innerText.toLowerCase();
    });
    let node = document.querySelector('.content');
    const routes = new Routes();
    const router = new Router(node, routes);
    router.start();
  });
});

class Routes {
  constructor() {
    let inbox = new Inbox();
    this.compose = 'compose';
    this.inbox = inbox;
    this.sent = 'sent';
  }
}

// let inbox = new Inbox();
// 
// console.log(inbox.render());