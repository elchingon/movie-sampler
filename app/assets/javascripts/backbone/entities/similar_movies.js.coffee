@MovieSampler.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.SimilarMovie extends Entities.Model

  class Entities.SimilarMoviesCollection extends Entities.Collection
    model: Entities.SimilarMovie

    parse: (resp) ->
      resp.movies

  API =
    getSimilarMovies: (id, params = {}) ->
      _.defaults params,
                 apikey: App.request "rotten:tomatoes:api:key"
                

      movies = new Entities.SimilarMoviesCollection
      movies.url = "http://api.rottentomatoes.com/api/public/v1.0/movies/#{id}/similar.json?callback=?"
      movies.fetch
        reset: true
        data: params
      movies

  App.reqres.setHandler "similar:movie:entities", (id) ->
    API.getSimilarMovies id, limit: 4
