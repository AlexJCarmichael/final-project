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

  dislpayNPC: function () {
    var that = this;
    if (this.props.isGM === true) {
      return (
        <div>
          <h5>NPCs in this game</h5>
          {that.props.npcs.map(function(npc) {
            console.log(npc)
            return (
              <IndividualNPC name={npc.name} key={npc.id} characterId={npc.id} />
            )
          })}
        </div>
      )

    } else {
      return (<span></span>);
    }
  },

  render: function() {
    var url = "/characters/new?session_id=" + this.props.session_id;
    return (
        <div className="dash-display col s12 m7 important-card card">
          <h5 onClick={this.handleClick} className="clicky-button">Actors in this game</h5>
          <div className={this.state.divClass + " expand-me"}>
          <a href={url} className="center btn clicky-button right">Create</a>
            {this.props.characters.map(function(character) {
              return (
                <IndividualUser
                  user={character.user}
                  characterId={character.id}
                  name={character.name}
                  key={character.id}
                  />
              );
            })}
            {this.dislpayNPC()}
          </div>
        </div>
    );
  }
});
