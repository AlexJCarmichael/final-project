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
    return (<h6 onClick={this.handleClick} className="clicky-button btn">Edit this character</h6>)
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
        <h4>{charName}</h4>
        <p>{charBio}</p>
        <div className="row">
        <MakeRank
          className='col s6'
          subject="characters"
          id={charId}
          name="Level"
          rank={charLevel}
          charAttr="level"
          canEdit={that.state.editable}
          changeCharacter="true"
          />
          <MakeRank
            className='col s6'
            subject="characters"
            id={charId}
            name="Currency"
            rank={charCurrency}
            charAttr="currency"
            canEdit={that.state.editable}
            changeCharacter="true"
            />
        </div>
        <h6>Atributes</h6>
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
        <h6>Equipment</h6>
        <EquipmentSearch
          gameId={this.props.game_id}
          searchFor={this.props.searchFor}
          characterId={this.props.character_id} />
          {this.showEquipment()}
          {this.toggleEdit()}
      </div>
    );
  },
});
