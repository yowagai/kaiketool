function count() {
const articles = document.querySelectorAll('.history-htm1');

  articles.forEach(function (article) {
    article.addEventListener('mouseover', () => {
        article.setAttribute("style","box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.5)")
    })
    article.addEventListener('mouseout', () => {
        article.removeAttribute("style","box-shadow: 0px 0px 0px 0px rgba(0,0,0,0)")
    })
  })
};

window.addEventListener('load', count);
