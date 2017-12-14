
class DOMNodeCollection {
  constructor(elements) {
    this.elements = elements;
    this.events = {};
  }
  
  html(string) {
    if (string === undefined) {
      return this.elements[0].innerHTML;
    } else {
      this.elements.forEach((el) => (el.innerHTML = string));
    }
  }
  
  empty() {
    this.html("");
  }
  
  append(arg) {
    const strings = [];
    if (arg instanceof HTMLElement) {
      strings.push(arg.innerHTML);
    } else if (typeof arg === 'string') {
      strings.push(arg);
    } else {
      arg.each( (el) => strings.push(el.innerHTML) );
    }
    
    this.elements.forEach( (el) => {
      strings.forEach( (str) => (el.innerHTML += str) );
    });
  }
  
  attr(attribute, val){
    if (attribute === undefined) {
      return this.elements[0].attributes;
    }
    if (val === undefined) {
      return this.elements[0].getAttribute(attribute);
    }
    this.elements.forEach((el) => (el.setAttribute(attribute, val)));
  }
  
  addClass(val) {
    this.elements.forEach( (el) => {
      let klass = this.attr('class');
      el.setAttribute('class', (klass += ` ${val}`));
    });
  }
  
  removeClass(val) {
    this.elements.forEach( (el) => {
      let klass = this.attr('class').replace(val, "");
      el.setAttribute('class', klass);
    });
  }
  
  children() {
    let childrenArr = [];
    this.elements.forEach( (el) => (childrenArr = childrenArr.concat(Array.from(el.children))));
    return new DOMNodeCollection(childrenArr);
  }
  
  parent() {
    return this.elements[0].parentNode;
  }
  
  find(selector) {
    let found = [];
    this.elements.forEach( (el) => (found = found.concat(Array.from(el.querySelectorAll(selector)))));
    return new DOMNodeCollection(found);
  }
  
  remove() {
    this.elements.forEach( (el) => (el.remove()));
    this.elements = [];
  }
  
  on(eventType, action) {
    this.events[eventType] = action;
    this.elements.forEach( (el) => (el.addEventListener(eventType, action)));
  }
  
  off(eventType) {
    let action = this.events[eventType];
    this.elements.forEach( (el) => (el.removeEventListener(eventType, action)));
  }
}


module.exports = DOMNodeCollection;