var UserCard = React.createClass({
  propType: {
    users: React.PropTypes.array
  },

  getInitialState: function (){
    return {
      divClass: "hide-on-small-only"
    };
  },

  handleClick: function (){
    if (this.state.divClass === "hide-on-small-only") {
      this.setState({divClass: ""});
    }else {
      this.setState({divClass: "hide-on-small-only"});
    }
  },

  render: function() {
    return (
        <div className="dash-display col s12 m3 offset-m1">
          <h5 onClick={this.handleClick} className="clicky-button">Actors in this game</h5>
          <div className={this.state.divClass + " expand-me"}>
            {this.props.users.map(function(user) {
              return (
                <IndividualUser
                  userId={user.id}
                  key={user.id}
                  name={user.name}
                  characters={user.characters}
                  />
              );
            })}
              <strong>Invite a user to the game</strong>
          </div>
        </div>
    );
  }
});
