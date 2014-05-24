@MovieSampler.module "Views", (Views, App, Backbone, Marionette, $, _) ->

	_.extend Marionette.View::,

		templateHelpers: ->
			
			linkTo: (name, url, options = {}, safe_html="") ->
				_.defaults options,
					external: false
					glyphicon: false
					
				if options.glyphicon
					icon = "<i class='glyphicon glyphicon-#{options.glyphicon}'></i> "
				else
					icon = ""	 	

				url = "#" + url unless options.external

				"<a href='#{url}'>#{icon}#{@escape(name)}#{safe_html}</a>"
				
				
			dateFormatter: (date) ->
				date = new Date(date)
				(date.getMonth() + 1) + "/" + date.getDate() + "/" + date.getFullYear()
				
			downcase: (text) ->
				if text 
					text.toLowerCase();
				
				