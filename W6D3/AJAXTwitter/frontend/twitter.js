const FollowToggle = require('./follow_toggle.js');
const UsersSearch = require('./users_search.js');

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