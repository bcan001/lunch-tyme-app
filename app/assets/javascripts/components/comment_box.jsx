var CommentBox = React.createClass({
  getInitialState: function () {
    return JSON.parse(this.props.presenter);
  },

  render: function () {
    return (
      <div className="comment-box">
        <CommentList comments={ this.state.comments } />
      </div>
    );
  }
});