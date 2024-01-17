// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails';
import 'controllers';

let timeOut;
let searchHistory = [];

const search = () => {
  let searchValue = document.getElementById('search').value;
  const articleTitles = document.querySelectorAll('.article-title');

  articleTitles.forEach((title) => {
    if (
      title.innerText.toLowerCase().indexOf(searchValue.toLowerCase()) != -1
    ) {
      title.parentNode.style.display = 'block';
    } else {
      title.parentNode.style.display = 'none';
    }
  });
};

const detectSearchCompletion = () => {
  clearTimeout(timeOut);
  timeOut = setTimeout(doneTimeOut, 2000);
};

document.getElementById('search').addEventListener('input', () => {
  const newSearch = document.getElementById('search').value;
  searchHistory.push(newSearch);
  detectSearchCompletion();
  search();
});

const doneTimeOut = () => {
  const search = searchHistory.pop();

  if (search !== '') {
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
