$(document).ready(function(){
  $('.slider').slick({
    autoplay: true, // 自動再生を有効にする場合
    autoplaySpeed: 5000, // 自動再生のスピードを指定する場合
    arrows: true, // 前後の矢印を表示する場合
    dots: true, // ページネーションを表示する場合
    speed: 500, // スライドのスピードを指定する場合
    slidesToShow: 1, // 一度に表示するスライドの数を指定する場合
    slidesToScroll: 1 // スライドをスクロールする数を指定する場合
  });
});