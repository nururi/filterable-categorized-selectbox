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
    firstSelect.addEventListener('change', setSecondChoices); // type: 'input' is not effective.
  }

  /* get tiles json by fetch api */
  async function getTiles(tile_category_id) {
    const params = new URLSearchParams();
    params.set('tile_category_id', tile_category_id);
    const apiURL = `/api/tiles?${params}`;
    const response = await fetch(apiURL);
    const json = await response.json();
    return json;
  }

  /* set values to second select */
  function setSecondChoices() {
    const secondSelect = document.getElementById('second_select');
    const choices = secondSelect.choices;
    /* clear current values & selected item */
    choices.clearStore();
    const tile_category_id = firstSelect.value;
    getTiles(tile_category_id).then(json => {
      // setChoices(choices, value, label, replaceChoices);
      choices.setChoices(json, 'index', 'display_name', true);
    });
  }
});
