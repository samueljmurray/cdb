window.onload = () => {
  const menuToggleOpen = document.getElementById("menu-toggle-open");
  const menuToggleClose = document.getElementById("menu-toggle-close");
  const navContainer = document.getElementById("nav-container");

  menuToggleOpen.addEventListener("click", () => {
    navContainer.classList.add("active");
  });
  menuToggleClose.addEventListener("click", () => {
    navContainer.classList.remove("active");
  });
}