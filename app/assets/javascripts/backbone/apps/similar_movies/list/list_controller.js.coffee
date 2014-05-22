@MovieSampler.module "SimilarMoviesApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Controller extends App.Controllers.Base

		initialize: (options)->
			similar = App.request "similar:movie:entities", options.id
			
			similarMoviesView = @getSimilarMoviesView similar
			
			@show similarMoviesView,
				loading: true

		getSimilarMoviesView: (similar) ->
			new List.SimilarMovies
				collection: similar