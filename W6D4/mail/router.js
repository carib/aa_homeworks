class Router {
  constructor(node, routes) {
    this.node = node;
    this.routes = routes;
  }
  
  start() {
    window.addEventListener('hashchange', () => {
      this.render();
    });
  }
  
  render() {
    this.node.innerHTML = '';
    let component = this.activeRoute();
    if (component) {
      this.node.innerHTML = '';
      let newNode = component.render();
      this.node.appendChild(newNode);
    } else {
      this.node.innerHTML = '';
    }    
  }
  
  activeRoute() {
    let location = window.location.hash.slice(1);
    return this.routes[location];
  }
}

module.exports = Router;