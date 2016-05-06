var CharacterSheet = React.createClass({
  getInitialState: function(){
    return {
      charSkills: [],
      charStats: []
    };
  },

  componentDidMount: function () {
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

  render: function () {
    console.log(this.state.charSkills)
    return (
      <span></span>
    );
  },
});
