class App.Views.Content extends Backbone.View

	className: "row"

	template: HandlebarsTemplates['app/templates/content']

	render: ->
		@$el.html(@template())
		@

	initialize: ->
		@listenTo App.Vent, "project:create", @swapMainToEmpty

	swapMainToEmpty: ->
		@swapMain(new App.Views.Empty())
		Backbone.history.navigate("/projects")

	swapMain: (v) ->
		@changeCurrentMainView(v)
		@$('#main-area').html(@currentMainView.render().el)

	changeCurrentMainView: (v) ->
		@currentMainView.remove() if @currentMainView
		@currentMainView = v

	swapSide: (v) ->
		@changeCurrentSideView(v)
		@$('#sidebar-area').html(@currentSideView.render().el)

	changeCurrentSideView: (v) ->
		@currentSideView.remove() if @currentSideView
		@currentSideView = v