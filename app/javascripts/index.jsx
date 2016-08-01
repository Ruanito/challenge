"use strict";

var ImputSearch = React.createClass({
  getInitialState: function(){
    return {city: ""};
  },
  changeCity: function(evt){
    this.setState({city: evt.target.value});
    console.log(this.state.city);
    $.ajax({
      url: this.props.url + this.state.city,
      dataType: 'json',
      cache: false,
      success: function(response){
        $.each(response, function(index, value){
          console.log(value);
        });
      }.bind(this)
    });
  },
  render: function(){
    return (
      <div className="divCity">
        <input type="text" className="cityName" value={this.state.city} onChange={this.changeCity} />
      </div>
    )
  }
});

var Comment = React.createClass({
  render: function(){
    return (
      <div className="comment">
        <h2 className="commentAuthor">
          {this.props.author}
        </h2>
        {this.props.children}
      </div>
    );
  }
});

var CommentList = React.createClass({
  render: function(){
    var commentNodes = this.props.data.map(function(comment){
      return (
        <Comment author={comment.author} key={comment.id}>
          {comment.text}
        </Comment>
      );
    });
    return (
      <div className="commentList">
        {commentNodes}
      </div>
    )
  }
})

var CommentBox = React.createClass({
  getInitialState: function(){
    return {data: []};
  },
  componentDidMount: function(){
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      cache: false,
      success: function(response){
        var data_a = [];
        $.each(response, function(index, value){
          data_a.push({author: value.city, text: value.country
          });
        });
        this.setState({data: data_a});
      }.bind(this)
    });
  },
  render: function() {
    return (
      <div className="commentBox">
        Hello, world! I am a CommentBox.
        <h1>Comments</h1>
        <CommentList data={this.state.data}/>
      </div>
    );
  }
});

ReactDOM.render(
  <ImputSearch url="/city/" />,
  document.getElementById('content')
);