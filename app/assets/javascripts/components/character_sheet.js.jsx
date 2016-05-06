var CharacterSheet = React.createClass({
  render: function() {
    return (
      <div>
        <h6>Atributes</h6>
        {this.props.stats.map(function(stat) {
          return (
          <MakeStats
            key={stat.id}
            name={stat.name}
            />
          );
        })}
        <h6>Skills</h6>
        {this.props.skills.map(function(skill) {
          return (
          <MakeSkills
            key={skill.id}
            name={skill.name}
            />
          );
        })}
      </div>
    );
  },
});
