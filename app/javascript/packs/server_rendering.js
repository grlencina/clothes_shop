// By default, this pack is loaded for server-side rendering.
// It must expose react_ujs as `ReactRailsUJS` and prepare a require context.
var componentRequireContext = require.context("components", true);
var ReactRailsUJS = require("../../../node_modules/@rails/ujs/lib/assets/compiled/rails-ujs");
ReactRailsUJS.useContext(componentRequireContext);
