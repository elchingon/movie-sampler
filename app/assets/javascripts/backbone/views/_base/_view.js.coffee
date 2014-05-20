@MovieSampler.module "Views", (Views, App, Backbone, Marionette, $, _) ->

	_.extend Marionette.View::,

		templateHelpers: ->
			
			linkTo: (name, url, options = {}, safe_html="") ->
				_.defaults options,
					external: false

				url = "#" + url unless options.external

				"<a href='#{url}'>#{@escape(name)}#{safe_html}</a>"
				
				
			dateFormatter: (date) ->
				date = new Date(date)
				(date.getMonth() + 1) + "/" + date.getDate() + "/" + date.getFullYear()
				