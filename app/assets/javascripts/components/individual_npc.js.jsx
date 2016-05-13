var IndividualNPC = React.createClass({
  render: function(){
    var charUrl = "/characters/" + this.props.characterId;
      return (
        <p><a href={charUrl}>{this.props.name}</a> </p>
      );
    }
});
