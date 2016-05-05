var UserCard = React.createClass({
  propType: {
    characters: React.PropTypes.array
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
    var url = "/characters/new?session_id=" + this.props.session_id;
    return (
        <div className="dash-display col s12 m3 offset-m1">
          <h5 onClick={this.handleClick} className="clicky-button">Actors in this game</h5>
          <div className={this.state.divClass + " expand-me"}>
            {this.props.characters.map(function(character) {
              return (
                <IndividualUser
                  characterId={character.id}
                  key={character.id}
                  name={character.name}
                  user={character.user}
                  />
              );
            })}
              <a href={url}>Create a character</a>
          </div>
        </div>
    );
  }
});
