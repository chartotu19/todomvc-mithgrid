MITHgrid.Presentation.namespace "AdvancedTextField", (AdvancedTextField)->
  AdvancedTextField.initInstance = (args...)->
    MITHgrid.Presentation.initInstance "MITHgrid.Presentation.AdvancedTextField", (that,container)->
      options = that.options

      #options
      # editable:
      # type:
      # UIevent:

      if !options.UIevent?
        UIevent = MITHgrid.DblClick.initInstance({})
      else
        UIevent = UIevent.initInstance({})

      that.hasLensFor = ->
        true


      that.render = (model, container, id)->
        rendering = {}

        el = $("<input type='text'>")

        UIevent.bind(container).events.on.addListener (e)->
          console.log e

        $(container).append el

        rendering.update = (item)->


        rendering.remove = (item)->


        rendering