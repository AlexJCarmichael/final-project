var CharacterSheet = React.createClass({
  render: function() {
    var charName = this.props.name;
    var charBio = this.props.bio;
    var that = this;
    var showEquipment =  function () {
      if (that.props.equipment.length === 0) {
        return (
          <p>This character has no equipment</p>
        );
      } else {
        {that.props.equipment.map(function(equip) {
          return (
          <MakeEquip
            key={equip.id}
            name={equip.name}
            rank={equip.type}
            />
          );
        })}
      }
    }
    return (
      <div>
        <h4>{charName}</h4>
        <p>{charBio}</p>
        <h6>Atributes</h6>
        {this.props.stats.map(function(stat) {
          return (
          <MakeStats
            key={stat.id}
            name={stat.name}
            rank={stat.rank}
            />
          );
        })}
        <h6>Skills</h6>
        {this.props.skills.map(function(skill) {
          return (
          <MakeSkills
            key={skill.id}
            name={skill.name}
            rank={skill.rank}
            />
          );
        })}
        <h6>Equipment</h6>
          {showEquipment()}
      </div>
    );
  },
});
