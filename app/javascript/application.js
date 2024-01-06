// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails';
import 'controllers';

let timeOut;

const search = () => {
  let searchValue = document.getElementById('search').value;
  const articleTitles = document.querySelectorAll('.article-title');

  articleTitles.forEach((title) => {
    console.log(title.innerText);
    if (
      title.innerText.toLowerCase().indexOf(searchValue.toLowerCase()) != -1
    ) {
      title.parentNode.style.display = 'block';
    } else {
      title.parentNode.style.display = 'none';
    }
  });
};

document.getElementById('search').addEventListener('keyup', () => {
  clearTimeout(timeOut);
  timeOut = setTimeout(doneTimeOut, 4000);
  search();
});

const doneTimeOut = () => {
  const search = document.getElementById('search').value;

  if (search.length > 0) {
    fetch('/save_search', {
      method: 'POST',
      mode: 'no-cors',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ sentence: search }),
    })
      .then((response) => response.json())
      .catch((error) => {
        console.error('Error saving search', error);
      });
  }
};

