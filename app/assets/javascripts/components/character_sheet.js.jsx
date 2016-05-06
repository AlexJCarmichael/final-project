var CharacterSheet = React.createClass({
  getInitialState: function(){
    return {
      charSkills: [],
      charStats: []
    };
  },

  componentDidMount: function() {
    var that = this
    $.ajax({
      url: "/sheet_templates/" + this.props.sheet + "/grabber",
      dataType: "JSON",
      method: "get"
    }).done(function (response) {
      that.setState({
        charSkills: response.skills,
        charStats: response.stats
      });
    })
  },

  render: function() {
    return (
      <div>
        <h6>Atributes</h6>
        {this.state.charStats.map(function(stat) {
          return (
          <MakeStats
            key={stat.id}
            name={stat.name}
            />
          );
        })}
      </div>
    );
  },
});
