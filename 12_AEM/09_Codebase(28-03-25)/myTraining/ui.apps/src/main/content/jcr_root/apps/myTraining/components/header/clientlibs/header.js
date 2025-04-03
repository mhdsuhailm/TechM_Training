document.addEventListener("DOMContentLoaded", function () {
    const dropdownMenus = document.querySelectorAll(".nav-links li");

    dropdownMenus.forEach(menu => {
        const dropdown = menu.querySelector(".dropdown");

        if (dropdown) {
            menu.addEventListener("mouseenter", () => {
                dropdown.style.display = "block";
            });

            menu.addEventListener("mouseleave", () => {
                dropdown.style.display = "none";
            });
        }
    });
});
