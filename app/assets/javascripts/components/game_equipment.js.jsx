var GameEquipment = React.createClass({
  render: function () {
    return (<p>{this.props.equip.type}: {this.props.equip.subtype}: {this.props.equip.name}</p>);
  }
});
