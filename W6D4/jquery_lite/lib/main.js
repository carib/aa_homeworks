const DOMNodeCollection = require('./dom_node_collection.js');

// stack of functions
var stack = [];

// if (document.readyState === 'complete') {
//   stack.forEach()
// }

window.$l = function(arg) {
  if (arg instanceof Function) {
    stack.push(arg);
  } else {
    const array = [];
    
    if (arg instanceof HTMLElement) {
      array.push(arg);
    } else {
      const nodeList = document.querySelectorAll(arg);
      nodeList.forEach( (el) => (array.push(el)));
    }
    return new DOMNodeCollection(array);
  }
  document.addEventListener("DOMContentLoaded", function() {
    stack.forEach((el) => el());
    stack = [];
  });
};

$l.extend = function(...args) {
  const merged = {};
  args.forEach( el => {
    Object.entries(el).forEach( tuple => (merged[tuple[0]] = tuple[1]));
  });
  return merged;
};

$l.ajax = function(request) {
  const defaults = {
                    success: () => (console.log('success')),
                    error: () => (console.log('error')),
                    url: window.location.href,
                    method: 'GET',
                    data: '',
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8'
                    
  };
  request = $l.extend(defaults, request);
  
  const xhr = new XMLHttpRequest();
  xhr.open(request.method, request.url);
  xhr.onload = function() {
    console.log(JSON.parse(xhr.status));
    console.log(xhr.responseType);
    console.log(JSON.parse(xhr.response));
  };
  xhr.send(request.data);
};

$l.ajax({
  type: 'GET',
  url: "http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=bcb83c4b54aee8418983c2aff3073b3b",
  success(data) {
    console.log("We have your weather!");
    console.log(data);
  },
  error() {
    console.error("An error occurred.");
  },
});