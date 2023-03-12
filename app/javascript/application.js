// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails';
import 'controllers';
import search from './search';

let timeOut;

document.getElementById('search').addEventListener('keyup', () => {
  clearTimeout(timeOut);
  timeOut = setTimeout(doneTimeOut, 6000);
  search();
});

const doneTimeOut = () => {
  const search = document.getElementById('search').value;

  if (search.length > 0) {
    fetch('http://127.0.0.1:3000/save_search', {
      method: 'POST',
      mode: 'no-cors',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ sentence: search }),
    })
      .then((response) => response.status)
      .catch((error) => {
        console.error('Error saving search', error);
      });
  }
};
