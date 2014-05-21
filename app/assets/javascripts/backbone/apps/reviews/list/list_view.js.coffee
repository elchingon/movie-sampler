@MovieSampler.module "ReviewsApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.MovieReview extends App.Views.ItemView
		template: "reviews/list/_review"
		tagName: "div"
		className: "review-detail"

	class List.MovieReviews extends App.Views.CompositeView
		template: "reviews/list/list_layout"
		itemView: List.MovieReview
		itemViewContainer: "div#reviews-wrapper"
		className: "reviews-wrapper"