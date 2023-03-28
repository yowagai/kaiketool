// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "jquery";

import $ from 'jquery';
window.jQuery = $;
window.$ = $;

import 'slick-carousel';
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

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
