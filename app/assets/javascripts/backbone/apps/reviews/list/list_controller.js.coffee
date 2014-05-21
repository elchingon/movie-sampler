@MovieSampler.module "ReviewsApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Controller extends App.Controllers.Base

		initialize: (options)->
			reviews = App.request "movies:reviews:entities", options.id
			
			reviewsView = @getReviewsView reviews
			
			@show reviewsView,
				loading: true

		getReviewsView: (reviews) ->
			new List.MovieReviews
				collection: reviews