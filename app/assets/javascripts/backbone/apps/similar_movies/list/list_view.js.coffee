@MovieSampler.module "SimilarMoviesApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.SimilarMovie extends App.Views.ItemView
		template: "similar_movies/list/_movie"
		tagName: "div"
		className: "similar-movie-detail"

	class List.Empty extends App.Views.ItemView
		template: "similar_movies/list/_empty"
		tagName: "empty-view"
		
	class List.SimilarMovies extends App.Views.CompositeView
		template: "similar_movies/list/list_layout"
		itemView: List.SimilarMovie
		emptyView: List.Empty
		itemViewContainer: "div#similar-movies-wrapper"
		className: "similar-movies-wrapper"