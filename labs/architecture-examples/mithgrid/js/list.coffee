MITHgrid.Presentation.namespace "List", (list)->
  list.initInstance = (args...)->
    MITHgrid.Presentation.initInstance "MITHgrid.Presentation.List", args..., (that,container)->
      options = that.options
      container = that.container
      dataView = that.dataView
      getState = options.getState
      
      #Create controller instances
      clickInstance = MITHgrid.Click.initInstance(
          selectors:
            "clicker":""
        )
      dblclickInstance = MITHgrid.DblClick.initInstance({})
      keypressInstance = MITHgrid.Enter.initInstance({})
      
      #not sure
      # but without this that.render doesnt trigger
      that.hasLensFor = -> true

      # Toggle the type of the todo item [active,compeleted]
      toggle = (obj)->
        p = $(obj.target).parent().parent()
        item = dataView.getItem p.attr "id"
        item.id = item.id[0]
        if obj.target.checked is true
          p.attr "class","completed"
          item.type = ["completed"]
        else
          p.attr "class","active"
          item.type = ["active"]
        dataView.updateItems [item]
        
      #hooked to the remove button
      remove = (obj)->
        dataView.removeItems $(obj.target).parent().parent().attr("id")

      addClass = (el,type)->
        return false if !el?
        el.removeClass "hidden"
        if (state = getState()) isnt "all"
          if state is "active" && type isnt "active"
            el.addClass "hidden"
          else if state is "completed" && type isnt "completed"
            el.addClass "hidden"

      that.render = (container,model,id)->
        rendering = {}
        item = model.getItem id

        el = $("<li></li>")
        rendering.el = el
        el.attr "class", item.type
        el.attr "id", item.id
        el.append "<div class=\"view\"></div>" 
        el.append "<input class=\"edit\" value=" + item.text + ">"
        el[0].childNodes[1].value = item.text
        t = $("<input class=\"toggle\" type=\"checkbox\">")
        if item.type is "completed"
          t.attr "checked",true
          el.find("div").append t
        else
          el.find("div").append t
        el.find("div").append "<label>" + item.text + "</label>"
        el.find("div").append "<button class=\"destroy\"></button>"

        $(container).append el
        addClass el, item.type

        clickInstance.bind("#"+item.id).events.onClick.addListener (e)->
          if (node = e.target.nodeName)?
            if node is "BUTTON"
              rendering.remove(e.target.id)
              remove e
            if node is "INPUT"
              toggle e
        
        dblclickInstance.bind("#"+item.id).events.on.addListener  (e)->
          if (node = e.target.nodeName)?
            if node is "LABEL"
              $(e.target).parent().parent().addClass "editing"

        keypressInstance.bind("#"+item.id+" input").events.onEnter.addListener  (e)->
          $(e.target).parent().removeClass "editing"
          $(e.target).parent().find("label").text e.target.value

        rendering.update = (item) ->
          addClass el, item.type[0]
          console.log "List update"      

        rendering.remove = (id)->
          el.remove()
          console.log "List remove"

        rendering
        
