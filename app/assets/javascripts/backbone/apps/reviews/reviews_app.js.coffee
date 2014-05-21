@MovieSampler.module "ReviewsApp", (ReviewsApp, App, Backbone, Marionette, $, _) ->

	API =
		list: (id, region) ->
			new ReviewsApp.List.Controller
				id: id
				region: region
	
	App.commands.setHandler "list:reviews:movies:reviews", (id, region) ->
		API.list id, region