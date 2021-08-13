

//"지도보기"눌럿을때 동작
window.addEventListener('DOMContentLoaded', event => {

    const sidebarToggle = document.body.querySelector('#sidebarToggle');
    if (sidebarToggle) {
        sidebarToggle.addEventListener('click', event => {
            document.body.classList.toggle('sb-sidenav-toggled');
        });
    }
});

