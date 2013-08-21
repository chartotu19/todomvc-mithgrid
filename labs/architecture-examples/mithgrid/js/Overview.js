// Generated by CoffeeScript 1.4.0
var __slice = [].slice;

MITHgrid.Presentation.namespace("Overview", function(Overview) {
  return Overview.initInstance = function() {
    var args, _ref;
    args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    return (_ref = MITHgrid.Presentation).initInstance.apply(_ref, ["MITHgrid.Presentation.Overview"].concat(__slice.call(args), [function(that, container) {
      var access, getActive, getCompleted, options;
      options = that.options;
      getActive = options.getActive;
      access = options.access;
      getCompleted = options.getCompleted;
      that.hasLensFor = function() {
        return true;
      };
      return that.render = function(container, model, id) {
        var c, el, item, rendering;
        console.log("render");
        rendering = {};
        item = model.getItem(id);
        el = $("");
        rendering.el = el;
        el.append("<span id=\"todo-count\"><strong>" + getActive() + "</strong> item left</span>");
        if ((c = getCompleted()) !== 0) {
          el.append("<button id=\"clear-completed\">Clear completed (" + c + ")</button>");
        }
        $(container).append(el);
        rendering.update = function(item) {
          return console.log("List update");
        };
        rendering.remove = function() {
          return console.log("List remove");
        };
        return rendering;
      };
    }]));
  };
});
