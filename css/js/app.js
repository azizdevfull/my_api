window.onload = () => {
  document.getElementsByClassName("preloader")[0].style.display = "none";
  document.getElementsByClassName("content-area")[0].style.display = "block";
};

document.addEventListener("DOMContentLoaded", function () {
  //SideNav init
  const sideNav = document.querySelectorAll(".sidenav");
  M.Sidenav.init(sideNav, {});

  //Collapsible Menu init
  var collapsible = document.querySelectorAll(".collapsible");
  M.Collapsible.init(collapsible, {});

  //ScrollSpy init
  const scrollSpy = document.querySelectorAll(".scrollspy");
  M.ScrollSpy.init(scrollSpy, { scrollOffset: 66 });
});
