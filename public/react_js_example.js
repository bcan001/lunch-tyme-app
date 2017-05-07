// rails controller
def index
  @presenter = {
    :comments => Comment.last(5),
    :form => {
      :action => comments_path,
      :csrf_param => request_forgery_protection_token,
      :csrf_token => form_authenticity_token
    }
  }
end



// commentbox.jsx
var CommentBox = React.createClass({
  getInitialState: function () {
    return JSON.parse(this.props.presenter);
  },

  handleCommentSubmit: function ( formData, action ) {
    $.ajax({
      data: formData,
      url: action,
      type: "POST",
      dataType: "json",
      success: function ( data ) {
        this.setState({ comments: data });
      }.bind(this)
    });
  },

  render: function () {
    return (
      <div className="comment-box">
        <img src={ this.props.imgSrc } alt={ this.props.imgAlt } />
        <CommentList comments={ this.state.comments } />
        <hr />
        <h2>Add a comment:</h2>
        <CommentForm form={ this.state.form } onCommentSubmit={ this.handleCommentSubmit } />
      </div>
    );
  }
});



// comment_list.jsx
var CommentList = React.createClass({
  render: function () {
    var commentNodes = this.props.comments.map(function ( comment ) {
      return <Comment author={ comment.author } text={ comment.text } key={ comment.id } />
    });

    return (
      <div className="comment-list">
        { commentNodes }
      </div>
    )
  }
});



// comment.jsx
var Comment = React.createClass({
  render: function () {
    return (
      <div>
        <h4>{ this.props.author } said:</h4>
        <p>{ this.props.text }</p>
      </div>
    )
  }
});



// view layer
<%= react_component('CommentBox', {:presenter => @presenter.to_json, :imgSrc => image_path("gundam.jpg")}, {:prerender => true}) %>











