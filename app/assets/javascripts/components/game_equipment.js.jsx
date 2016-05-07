var GameEquipment = React.createClass({
  render: function () {
    var url = "/equipment/" + this.props.equip.id +  "/charequip?char_id=" + this.props.char_id
    return (<p>
              <a rel="nofollow" data-method="POST" href={url}>
                {this.props.equip.category}: {this.props.equip.sub_category}: {this.props.equip.name}
              </a>
            </p>);
  }
});
