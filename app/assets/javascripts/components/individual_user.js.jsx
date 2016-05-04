var IndividualUser = React.createClass({
  render: function(){
    var url = "/user/" + this.props.user.id;
    var charUrl = "/characters/" + this.props.characterId;
      return (
        <p> <a href={url}>{this.props.user.name} </a> as <a href={charUrl}>{this.props.name}</a> </p>
      );
    }
});
