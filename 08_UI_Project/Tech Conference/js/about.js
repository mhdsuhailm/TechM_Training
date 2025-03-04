document.addEventListener('DOMContentLoaded', function () {
  // Fade-in effect on scroll
  const aboutWrapper = document.querySelector('.about-wrapper')
  const observer = new IntersectionObserver(
    entries => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          aboutWrapper.classList.add('fade-in')
        }
      })
    },
    { threshold: 0.2 }
  )

  observer.observe(aboutWrapper)
})

// Button alert
document.querySelectorAll('.btn-read-more').forEach(button => {
  button.addEventListener('click', () => {
    alert('More details coming soon!')
  })
})
