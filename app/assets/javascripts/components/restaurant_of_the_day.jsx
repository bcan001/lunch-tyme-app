var RestaurantOfTheDay = React.createClass({
  render: function () {
    return (
      <div className="medium-4 columns">
      	<img src={ this.props.image_url }></img>
        <h5>{ this.props.name }</h5>
      	<img src={ this.props.rating_img_url_small }></img>
        <p>{ this.props.phone }</p>
      </div>
    )
  }
});