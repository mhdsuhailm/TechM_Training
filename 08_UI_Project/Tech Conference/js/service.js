document.addEventListener('DOMContentLoaded', function () {
  const serviceItems = document.querySelectorAll('.services-item')
  serviceItems.forEach((item, index) => {
    item.style.animation = `fadeInDown 0.5s ease ${index * 0.2}s both`
  })
})

// CSS Animation
const style = document.createElement('style')
style.innerHTML = `
@keyframes fadeInDown {
    from {
        opacity: 0;
        transform: translateY(-20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}`
document.head.appendChild(style)
