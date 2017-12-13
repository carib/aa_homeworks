const APIUtil = require('./api_util.js');

function UsersSearch(el) {
  this.$el = $(el);
  this.$input = this.$el.find('input');
  this.$ul = this.$el.find('ul');
  
  this.handleInput();
}



// NOTE: BELOW DOES NOT WORK.



UsersSearch.prototype.renderResults = function () {
  
  // // this.$ul.empty();
  // debugger
  // $(this.$ul.users).each((user) => {
  //   this.$ul.append(`<li>${user}</li>`);
  // });
  // .each((result) => {
  // });
};

UsersSearch.prototype.handleInput = function () {
  
  this.$input.on('input', (event) => {
  // 
  // 
  //   let success = () => {
  //     this.renderResults();
  //   };
  // 
  //   APIUtil.searchUsers($(event.target).val(), success);
  //     debugger
  //     success();
  // });
};




module.exports = UsersSearch;