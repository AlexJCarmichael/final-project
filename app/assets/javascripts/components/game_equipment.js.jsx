var GameEquipment = React.createClass({
  render: function () {
    console.log(this.props)
    return (<p>{this.props.equip.category}: {this.props.equip.sub_category}: {this.props.equip.name}</p>);
  }
});
