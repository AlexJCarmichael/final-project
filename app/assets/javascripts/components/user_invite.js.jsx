var UserInvite = React.createClass({
  render: function () {
    var url = "/users/friendship?to_user_id=" + this.props.user.id;
    return (<p>
              {this.props.user.name}: {this.props.user.user_name} |
              <a className="sml-left-margin sml-right-padding create" rel="nofollow" data-method="POST" href={url}>   Request</a>
            </p>);
  }
});
