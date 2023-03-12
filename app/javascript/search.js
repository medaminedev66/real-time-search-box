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

export default search;
