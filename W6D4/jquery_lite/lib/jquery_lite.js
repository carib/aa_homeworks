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
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const DOMNodeCollection = __webpack_require__(1);

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

/***/ }),
/* 1 */
/***/ (function(module, exports) {


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

/***/ })
/******/ ]);