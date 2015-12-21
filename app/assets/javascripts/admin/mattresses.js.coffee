$(document).on('change', '.toggle_all_link', ->
  container = $(@).closest('.toggable-container')
  all_checkboxes = container.find('.toggable').not(@)#.not(container.find('.toggable-container .toggable'))
  if $(@).is(':checked')
    all_checkboxes.attr('checked', 'checked').change()
  else
    all_checkboxes.removeAttr('checked').change()
)
