$(document).on 'submit', '.new_message', (e) ->
  e.preventDefault()
  values = $(this).serializeArray()
  App.conversation.speak(values)
  $(this).trigger('reset')



$(document).on 'keypress', '#text-chat-area', (e) ->
  if e.which == 13
    e.preventDefault()
    $('.btn-send').click()
  return