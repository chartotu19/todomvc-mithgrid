MITHgrid.Presentation.namespace "Overview", (Overview)->
  Overview.initInstance = (args...)->
    MITHgrid.Presentation.initInstance "MITHgrid.Presentation.Overview", args..., (that,container)->
      options = that.options
      getActive = options.getActive
      access = options.access
      getCompleted = options.getCompleted
      # the data item
      # text, status
      
      #not sure
      # but without this that.render doesnt trigger
      that.hasLensFor = -> true

      that.render = (container,model,id)->
        console.log "render"
        rendering = {}
        item = model.getItem id
        el = $("")
        rendering.el = el
        el.append "<span id=\"todo-count\"><strong>"+getActive()+"</strong> item left</span>"
        # <ul id="filters">
        #   <li>
        #     <a class="selected" href="#/">All</a>
        #   </li>
        #   <li>
        #     <a href="#/active">Active</a>
        #   </li>
        #   <li>
        #     <a href="#/completed">Completed</a>
        #   </li>
        # </ul>

        if (c = getCompleted()) isnt 0
          el.append "<button id=\"clear-completed\">Clear completed ("+c+")</button>"
        $(container).append el
        
        rendering.update = (item) ->
          console.log "List update"      
        rendering.remove = ->
          console.log "List remove"
        rendering
        
        




        
