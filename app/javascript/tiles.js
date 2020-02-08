document.addEventListener('DOMContentLoaded', function() {
  /* apply choices to select boxes */
  const choicesOptions = {
    shouldSort: false,
    removeItemButton: true,
    searchResultLimit: 9,   // default: 4
    searchFields: ['label'] // default: ['label', 'value']
  };
  const selects = document.querySelectorAll('select');
  selects.forEach(function(select) {
    select.choices = new Choices(select, choicesOptions);
  });

  /* add event listener to first select */
  const firstSelect = document.getElementById('first_select')
  if (firstSelect != null) {
    firstSelect.addEventListener('change', setSecondChoices); // inputだと発火しない
  }

  /* set values to second select */
  function setSecondChoices() {
    const secondSelect = document.getElementById('second_select');
    const choices = secondSelect.choices;
    /* clear current values & selected item */
    choices.clearStore();
    const tile_category_id = firstSelect.value;
    const params = new URLSearchParams();
    params.set('tile_category_id', tile_category_id);
    const url = `/api/tiles?${params}`;
    /* get tiles JSON by fetch api */
    fetch(url).then(function(response) {
      return response.json();
    }).then(function(json) {
      console.info(`json: ${JSON.stringify(json)}`);
      if (json != null) {
        // setChoices(choices, value, label, replaceChoices);
        choices.setChoices(json, 'index', 'display_name', true);
      }
    });
  }
});
