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
    return (<p onClick={this.handleClick} className="clicky-button">Edit this character</p>)
  },

  render: function() {
    var charName = this.props.name;
    var charBio = this.props.bio;
    var that = this;
    return (
      <div>
        <h4>{charName}</h4>
        <p>{charBio}</p>
        <h6>Atributes</h6>
        {this.props.stats.map(function(stat) {
          return (
          <MakeStats
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
          {this.showEquipment()}
          {this.toggleEdit()}
          <GameEquipmentSearch
            gameId={this.props.game_id}/>
      </div>
    );
  },
});
