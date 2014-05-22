@MovieSampler.module "MoviesApp.Show", (Show, App, Backbone, Marionette, $, _) ->

	class Show.Controller extends App.Controllers.Base

		initialize: (options) ->
			movie = App.request "movie:info:entity", options.id

			@layout = @getLayoutView()

			@listenTo @layout, "show", =>
				@showMovie movie
				@listSimilarMovies movie

			@show @layout,
				loading: 	
					entities: movie
			
			
		showMovie: (movie) ->
			movieView = @getMovieView movie
			
			@listenTo movieView, "list:movies:reviews:clicked", ->
				App.execute "list:reviews:movies:reviews", movie.id, @layout.reviewsRegion

			@show movieView, region: @layout.movieRegion
		
		listSimilarMovies: (movie) ->
			App.execute "list:similar:movies", movie.id, @layout.similarMoviesRegion

		getMovieView: (movie) ->
	      new Show.Movie
	        model: movie		

		getLayoutView: ->
			new Show.Layout