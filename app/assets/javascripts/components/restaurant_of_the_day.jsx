var RestaurantOfTheDay = React.createClass({
  render: function () {
    return (
      <div className="medium-4 columns">
      	<img src={ this.props.image_url }></img>
        <p><a href={"/restaurants/" + this.props.id}>{ this.props.name }</a></p>
      	<img src={ this.props.rating_img_url_small }></img>
        <p>{ this.props.phone }</p>
        <p>link to menu</p>
        <p>link to order</p>
      </div>
    )
  }
});