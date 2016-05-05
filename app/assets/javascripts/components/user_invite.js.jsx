var UserInvite = React.createClass({
  render: function () {
    var url = "/users/friendship?to_user_id=" + this.props.user.id;
    return (<p><a rel="nofollow" data-method="POST" href={url} >{this.props.user.name}: {this.props.user.user_name}</a></p>);
  }
});
