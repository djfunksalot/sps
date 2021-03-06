define([
  'jquery',
  'underscore',
  'backbone',
  'i18n!nls/str',
  'backgrid',
  'views/form/FormView',
  'controllers/template/TemplateController',
  'models/uifilter/FilterModel',
  'models/template/TemplateModel',
], function($, _, Backbone, Str, Backgrid, FormView, Templates, FilterModel, TemplateModel){
//*  render the target object into the div specified by butternut

    var GrainView = FormView.extend({
        defaults: {
        },
        initialize: function(options) {
            //console.log("creating template view");
            view = this;
            var model = view.model;
            var spot = options.spot;
            view.spot_id = spot.get('id');
            var compiled = options.compiled;
            view.template = compiled;
            if(view.model.toJSON) {
                view.json = view.model.toJSON();
            }
            view.render();
        },
        render: function() {
            var view = this;
            view.$el = $('#spot_'+view.spot_id);
            this.height = this.$el.height();
            this.width = this.$el.width();
            handlers = [];
            if (view.model.deferred) {
                view.model.deferred.done(function() {
                    view.handle(view);
                });
            } else {
                view.handle(view);
            }
        },

        handle: function(view) {
            //remove any listeners that are bound to this view
            view.$el.off();
            view.$el.html(view.template(view));
            if (handlers[view.spot_id]) {
                handlers[view.spot_id](view);
            }
        },

    });
    return GrainView;


});
