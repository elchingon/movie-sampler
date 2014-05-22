@MovieSampler.module "MoviesApp.Show", (Show, App, Backbone, Marionette, $, _) ->

	class Show.Layout extends App.Views.Layout
		template: "movies/show/show_layout"

		regions:
			movieRegion: "#movie-region"
			reviewsRegion: "#reviews-region"
			similarMoviesRegion: "#similar-movies-region"

	class Show.Movie extends App.Views.ItemView
		template: "movies/show/_movie"
		tagName: "div"
		className: "movie-details"
		
		triggers:
			"click #movie-reviews-link" : "list:movies:reviews:clicked"
