var GameEquipmentSearch = React.createClass({
  getInitialState: function(){
    return {
      gameEquipment: [],
      filteredEquipment: [],
      search: "",
      divClass: "hide"
    };
  },

  handleClick: function (){
    if (this.state.divClass === "hide") {
      this.setState({divClass: ""});
    }else {
      this.setState({divClass: "hide"});
    }
  },

  filterList: function(event){
    var searchReturn = this.state.gameEquipment.filter(function (user) {
      return (equipment.name.toLowerCase().indexOf(event.target.value.toLowerCase()) !==-1 ||
              equipment.type.toLowerCase().indexOf(event.target.value.toLowerCase()) !==-1 ||
              equipment.subtype.toLowerCase().indexOf(event.target.value.toLowerCase()) !==-1);
    });
    this.setState({
      filteredUsers: searchReturn,
      search: event.target.value
    });
  },

  componentDidMount: function () {
    var that = this
    $.ajax({
      url: "/equipment/" + this.props.gameId + "/session",
      dataType: "JSON",
      method: "get"
    }).done(function (response) {
      that.setState({
        gameEquipment: response,
        filteredEquipment: []
      });
    })
  },

  equipmentDisplay: function(user){
    var that = this
    if (this.state.search.length > 1) {
        return this.state.filteredEquipment.map(function (equip){
            return (<GameEquipment key={equip.id} equip={equip}/>);
        });
    } else {
      return (<span></span>);
    }
  },

  render: function() {
    return (
      <div>
        <h6 onClick={this.handleClick} className="clicky-button">Add equipment</h6>
        <div className={this.state.divClass}>
          <input type="text"
          onChange={this.filterList} value={this.state.search}
          placeholder="Equipment Name or Type or Subtype" />
        </div>
        <div>
          {this.equipmentDisplay()}
        </div>
      </div>
    );
  },
});
