// Generated by CoffeeScript 1.4.0
var __slice = [].slice;

MITHgrid.namespace("Click", function(that) {
  return that.initInstance = function() {
    var args, _ref;
    args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    return (_ref = MITHgrid.Controller).initInstance.apply(_ref, ["MITHgrid.Click"].concat(__slice.call(args), [function(that) {
      return that.applyBindings = function(binding) {
        return binding.locate('clicker').click(function(e) {
          return binding.events.onClick.fire(e);
        });
      };
    }]));
  };
});

MITHgrid.namespace("DblClick", function(that) {
  return that.initInstance = function() {
    var args, _ref;
    args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    return (_ref = MITHgrid.Controller).initInstance.apply(_ref, ["MITHgrid.DblClick"].concat(__slice.call(args), [function(that) {
      return that.applyBindings = function(binding) {
        return binding.locate('').dblclick(function(e) {
          return binding.events.on.fire(e);
        });
      };
    }]));
  };
});

MITHgrid.namespace("Enter", function(that) {
  return that.initInstance = function() {
    var args, _ref;
    args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    return (_ref = MITHgrid.Controller).initInstance.apply(_ref, ["MITHgrid.Enter"].concat(__slice.call(args), [function(that) {
      return that.applyBindings = function(binding) {
        binding.locate('').blur(function(e) {
          return binding.events.onEnter.fire(e);
        });
        return binding.locate('').keypress(function(e) {
          var code;
          code = e.keyCode ? e.keyCode : e.which;
          if (code === 13) {
            return binding.events.onEnter.fire(e);
          }
        });
      };
    }]));
  };
});
