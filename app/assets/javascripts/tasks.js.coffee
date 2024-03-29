$(document).ready ->
  $('form').submit (event) ->
    event.preventDefault()
    taskTitle = $('#task_title').val()
    $.ajax
      type: 'post'
      url: '/tasks'
      data: { task: { title: taskTitle } }
      success: (task) ->
        $('#success').text('task added successfully').show()
        $('<li>').text(task.title).appendTo('#task-list')
        $('#task_title').val('')
      error: (response) ->
        data = JSON.parse(response.responseText)
        message = ""
        for field, errors of data
          message += "#{field}: #{errors.join(', ')}"
        $('#error').text(message).show()


