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
      if (this.state.search.length > 1) {
        return this.state.filteredUsers.map(function (user){
            return (<UserInvite key={user.id} user={user}/>);
        });
      } else {
        return (<span></span>);
      }
    },

    render: function() {
      return (
        <div>
          <div>
            <input className="form-control" type="text"
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
