@MovieSampler.module "MoviesApp", (MoviesApp, App, Backbone, Marionette, $, _) ->

	class MoviesApp.Router extends Marionette.AppRouter
		appRoutes:
			"movies/:id": "showMovie"
		
	API =
		showMovie: (id) ->
			new MoviesApp.Show.Controller
				id: id
			
	App.addInitializer ->
		new MoviesApp.Router
			controller: API
