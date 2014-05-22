@MovieSampler.module "SimilarMoviesApp", (SimilarMoviesApp, App, Backbone, Marionette, $, _) ->

	API =
		list: (id, region) ->
			new SimilarMoviesApp.List.Controller
				id: id
				region: region
	
	App.commands.setHandler "list:similar:movies", (id, region) ->
		API.list id, region