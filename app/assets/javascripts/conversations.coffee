$(document).on 'submit', '.new_message', (e) ->
  e.preventDefault()
  values = $(this).serializeArray()
  mess = values[2].value.trim()
  if mess
    App.conversation.speak(values)
    $(this).trigger('reset')
  return



$(document).on 'keypress', '.text-chat-area', (e) ->
  if e.which == 13
    e.preventDefault()
    $(e.target).next().click()
  return