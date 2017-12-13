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

const FollowToggle = __webpack_require__(2);
const UsersSearch = __webpack_require__(5);

document.addEventListener("DOMContentLoaded", function () {
  const followButtons = $("button.follow-toggle");
  followButtons.each((index, el) => {
    new FollowToggle(el);
  });
  
  const usersSearch = $('nav.users-search');
  usersSearch.each((index, el) => {
    new UsersSearch(el);
  });
});


window.$ = $;   

/***/ }),
/* 1 */,
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(4);

function FollowToggle(el) {
  this.$el = $(el);
  this.userId = this.$el.data('user-id');
  this.followState = this.$el.data('initial-follow-state');
  
  this.render();
  this.handleClick();
}

FollowToggle.prototype.render = function () {
  if (this.followState === 'unfollowed') {
    this.$el.text('Follow!');
  } else {
    this.$el.text('Unfollow!');
  }
};

FollowToggle.prototype.toggleState = function () {
  if (this.followState === 'unfollowed') {
    this.followState = 'followed';
  } else {
    this.followState = 'unfollowed';
  }
};

FollowToggle.prototype.handleClick = function () {

  this.$el.on('click', (event) => {
            event.preventDefault();
            
            const formData = $(event.currentTarget);

            let success = () => {
              this.toggleState();
              this.$el.prop("disabled", false);
              this.render();
            };
            
            let failure = () => {
              alert('WRONG THING HAPPENS');
            };
                    
            if (this.followState === 'unfollowed') {
              APIUtil.followUser(this.userId).then(success, failure);
              this.$el.prop("disabled", true);
            } else {
              APIUtil.unfollowUser(this.userId).then(success, failure);
              this.$el.prop("disabled", true);
            } 
                    
  });
};


module.exports = FollowToggle;

/***/ }),
/* 3 */,
/* 4 */
/***/ (function(module, exports) {

const APIUtil = {
  followUser: id => {
    return $.ajax({
            url: `/users/${id}/follow`,
            type: 'POST',
            dataType: 'json'
    });
  },

  unfollowUser: id => {
    return $.ajax({
            url: `/users/${id}/follow`,
            type: 'DELETE',
            dataType: 'json'
    });
  },
  
  searchUsers: (queryVal) => {
    return $.ajax({
      url: '/users/search',
      type: 'GET',
      dataType: 'json',
      data: { query: queryVal }
    });
  }
};

module.exports = APIUtil;


/***/ }),
/* 5 */
/***/ (function(module, exports) {

throw new Error("Module parse failed: Unexpected token (41:1)\nYou may need an appropriate loader to handle this file type.\n|   //     success();\n|   // });\n| };\n| \n| ");

/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map