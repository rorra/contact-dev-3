// Author: Ilija Studen for the purposes of Uni–Form

// Modified by Aris Karageorgos to use the parents function

// Modified by Toni Karlheinz to support input fields' text
// coloring and removal of their initial values on focus

jQuery.fn.uniform = function(settings) {
  settings = jQuery.extend({
    valid_class    : 'valid',
    invalid_class  : 'invalid',
    focused_class  : 'focused',
    holder_class   : 'element',
    field_selector : ':text, textarea, input[type=checkbox]',
    default_value_color: "#FFFFCC"
  }, settings);

  return this.each(function() {
    var form = jQuery(this);
    // Select form fields and attach them higlighter functionality
    form.find(settings.field_selector).each(function(){
      var default_color = $(this).css("color");
      $(this).focus(function() {
        form.find('.' + settings.focused_class).removeClass(settings.focused_class);
        $(this).parents('div.ctrlHolder').addClass(settings.focused_class);
      }).blur(function() {
        form.find('.' + settings.focused_class).removeClass(settings.focused_class);
      });
    })
  });
};
// Auto set on page load...
$(document).ready(function() {
  jQuery('form').uniform();
});

