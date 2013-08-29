class App.Views.Footer extends Backbone.View
	className: "navbar"

	template: HandlebarsTemplates['app/templates/footer']

	render: ->
		@$el.html(@template())
		@