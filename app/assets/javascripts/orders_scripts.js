 $(() => { 

  $(".orderInUserPage").on("click", function() { 
    $(this).next().toggleClass("collapse");
   })
  
  function scrollToAnchor(aid){
    var aTag = $(aid);
    $('html,body').animate({scrollTop: aTag.offset().top},'slow');
  }

  $("a[href='#deleteAccount']").on("click", function (event) { 
    event.preventDefault()
    scrollToAnchor("#deleteAccount")
  })
  $("a[href='#showAccount']").on("click", function (event) { 
    event.preventDefault()
    scrollToAnchor("#showAccount")
  })
  $("a[href='#showOrders']").on("click", function (event) { 
    event.preventDefault()
    scrollToAnchor("#showOrders")
  })


 })