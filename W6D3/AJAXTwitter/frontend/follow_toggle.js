const APIUtil = require('./api_util.js');

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