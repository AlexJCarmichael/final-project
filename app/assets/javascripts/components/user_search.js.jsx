var UserSearch = React.createClass({
    getInitialState: function(){
      return {
        allUsers: [],
        filteredUsers: [],
        search: ""
      };
    },

    filterList: function(event){
      var searchReturn = this.state.allUsers.filter(function (user) {
        return (user.name.toLowerCase().indexOf(event.target.value.toLowerCase()) !==-1 ||
                user.user_name.toLowerCase().indexOf(event.target.value.toLowerCase()) !==-1);
      });
      this.setState({
        filteredUsers: searchReturn,
        search: event.target.value
      });
    },

    componentDidMount: function () {
      var that = this
      $.ajax({
        url: "/users/",
        dataType: "JSON",
        method: "get"
      }).done(function (response) {
        that.setState({
          allUsers: response,
          filteredUsers: []
        });
      })
    },

    userNames: function(user){
      var that = this
      if (this.state.search.length > 1) {
        if (this.props.userInvite === true) {
          return this.state.filteredUsers.map(function (user){
              return (<UserInvite key={user.id} user={user}/>);
          });
        } else {
            return this.state.filteredUsers.map(function (user){
                return (<CreatePlayer key={user.id} user={user} game={that.props.game}/>);
            });
          }
      } else {
        return (<span></span>);
      }
    },

    render: function() {
      return (
        <div>
          <h6 className={this.props.buttonStyle}>Request a friend</h6>
          <div>
            <input type="text"
            onChange={this.filterList} value={this.state.search}
            placeholder="Username or User's name" />
          </div>
          <div>
            {this.userNames()}
          </div>
        </div>
      );
    },
  });
