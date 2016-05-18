var CharacterSheet = React.createClass({
  getInitialState: function(){
    return {
      editable: false,
    };
  },
  showEquipment: function () {
    if (this.props.equipment.length === 0) {
      return (
        <p>This character has no equipment</p>
      );
    } else {
      return this.props.equipment.map(function(equip) {
        return (
          <ShowEquip
            key={equip.id}
            name={equip.name}
            category={equip.category}
            />
        );
      });
    }
  },

  handleClick: function (){
    this.setState({
      editable: !this.state.editable
    });
  },

  toggleEdit: function (){
    return (<h6 onClick={this.handleClick} className="clicky-button btn right">Edit</h6>)
  },

  render: function() {
    var charName = this.props.name;
    var charBio = this.props.bio;
    var charLevel = this.props.level;
    var charCurrency = this.props.currency;
    var charId = this.props.id;
    var that = this;
    return (
      <div>
        <h4 className="center-text-only-small">{charName} {this.toggleEdit()}</h4>
        <p>{charBio}</p>
        <div className="row">
          <div className="col s12 m6 l6">
            <MakeRank
              subject="characters"
              id={charId}
              name="Level"
              rank={charLevel}
              charAttr="level"
              canEdit={that.state.editable}
              changeCharacter="true"
              />
            </div>
            <div className="col s12 m6 l6">
              <MakeRank
                subject="characters"
                id={charId}
                name="Currency"
                rank={charCurrency}
                charAttr="currency"
                canEdit={that.state.editable}
                changeCharacter="true"
                />
            </div>
        </div>
        <div className="row">
          <div className="col s12 m6 l6">
            <h6>Attributes</h6>
            {this.props.stats.map(function(stat) {
              return (
              <MakeRank
                subject="stats"
                key={stat.id}
                id={stat.id}
                name={stat.name}
                rank={stat.rank}
                canEdit={that.state.editable}
                />
              );
            })}
            </div>
            <div className="col s12 m6 l6">
              <h6>Skills</h6>
              {this.props.skills.map(function(skill) {
                return (
                <MakeRank
                  subject="skills"
                  key={skill.id}
                  id={skill.id}
                  name={skill.name}
                  rank={skill.rank}
                  canEdit={that.state.editable}
                  />
                );
              })}
              </div>
          </div>
          <h6 className="center">Equipment</h6>
          <EquipmentSearch
            alingment="center"
            gameId={this.props.game_id}
            searchFor={this.props.searchFor}
            characterId={this.props.character_id} />
            {this.showEquipment()}
        </div>
    );
  },
});
