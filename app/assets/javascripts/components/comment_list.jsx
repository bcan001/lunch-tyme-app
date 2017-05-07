var CommentList = React.createClass({
  render: function () {
    var commentNodes = this.props.comments.map(function ( comment, i ) {
      return <Comment key={i} name={ comment.name } />
    });

    return (
      <div className="comment-list">
        <div className="row">
          { commentNodes }
        </div>
      </div>
    )
  }
});