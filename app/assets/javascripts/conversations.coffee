$(document).on 'submit', '.new_message', (e) ->
  e.preventDefault()
  values = $(this).serializeArray()
  App.conversation.speak(values)
  $(this).trigger('reset')