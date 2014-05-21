@MovieSampler.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Review extends Entities.Model

	class Entities.ReviewsCollection extends Entities.Collection
		model: Entities.Review
		
		parse: (resp) ->
			resp.reviews

	API =	
		getReviews: (url, params = {}) ->
			_.defaults params,
				apikey: App.request "rotten:tomatoes:api:key"
				country: "us"
				review_type: "top_critic"

			reviews = new Entities.ReviewsCollection
			reviews.url = "http://api.rottentomatoes.com/api/public/v1.0/#{url}.json?callback=?"
			reviews.fetch
				reset: true
				data: params
			reviews				
	
	App.reqres.setHandler "movies:reviews:entities", (id) ->
		API.getReviews "movies/#{id}/reviews",
			page_limit: 10
			page: 1
				