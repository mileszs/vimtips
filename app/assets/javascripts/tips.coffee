$ ->
  $('form').submit( (ev) -> ev.preventDefault())
  window.tips = []
  viewModel = {
    tips: ko.observableArray([]),
    query: ko.observable(''),
    search: (value) ->
      viewModel.tips.removeAll()
      for tip in window.tips
        if (tip.body.toLowerCase().indexOf(value.toLowerCase()) >= 0)
          viewModel.tips.push(tip)
    addTips: (tips) ->
      for tip in tips
        viewModel.tips.push(tip)
  }

  viewModel.query.subscribe(viewModel.search);
  ko.applyBindings(viewModel);

  $.getJSON('/tips.json', (data) ->
    parsedTips = data
    for tip in parsedTips
      tip['body'] = tip['body'].linkify()
      window.tips.push(tip)
    viewModel.addTips(parsedTips)
  )
