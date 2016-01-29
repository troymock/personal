function mobileMenu(){
  console.log($('.site-header').height());
  if ($('.site-header').height() < 120){
    $('.site-header').animate({height: "143px"}, 300);
  }
  else {
    $('.site-header').animate({height: "92px"}, 300);
  }
}