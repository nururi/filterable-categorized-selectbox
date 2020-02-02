document.addEventListener('DOMContentLoaded', function() {
  /* apply choices to select boxes */
  // const selectList = document.querySelectorAll('select');
  // selectList.forEach(function (select) {
  //   const choices = new Choices(select);
  // });
  /* select boxes */
  const firstSelect = document.getElementById('first_select');
  const secondSelect = document.getElementById('second_select');

  if (firstSelect != null) {
    firstSelect.addEventListener('change', setSecondChoces);
  }

  function initialize(select) {
    if (select.hasChildNodes()) {
      while (select.childNodes.length > 0) {
        select.removeChild(select.firstChild);
      }
      const blank = document.createElement('option');
      select.appendChild(blank);
    }
  }

  function setSecondChoces() {
    initialize(secondSelect);
    const tile_category_id = firstSelect.value;
    const params = new URLSearchParams();
    params.set('tile_category_id', tile_category_id);
    const url = `/api/tiles?${params}`;
    console.info(`url: ${url}`);
    /* get tiles JSON by fetch api */
    fetch(url).then(function(response) {
      return response.json();
    }).then(function(json) {
      console.info(`json: ${JSON.stringify(json)}`);
      if (json != null) {
        json.forEach(function(tile) {
          const option = document.createElement('option');
          option.text = tile[0];
          option.value = tile[1];
          secondSelect.appendChild(option);
        });
      }
    });
  }
});
