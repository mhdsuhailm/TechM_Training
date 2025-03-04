
document.addEventListener('DOMContentLoaded', function () {
  /***  CAROUSEL FUNCTIONALITY ***/
  const slides = document.querySelectorAll('.carousel-item')
  const prevBtn = document.querySelector('.prev-btn')
  const nextBtn = document.querySelector('.next-btn')
  const dots = document.querySelectorAll('.dot')

  let index = 0
  const totalSlides = slides.length

  function showSlide (i) {
    if (i >= totalSlides) index = 0
    if (i < 0) index = totalSlides - 1

    let offset = -index * 100
    const carouselInner = document.querySelector('.carousel-inner')
    if (carouselInner) {
      carouselInner.style.transform = `translateX(${offset}%)`
    }

    slides.forEach(slide => slide.classList.remove('active'))
    slides[index].classList.add('active')

    dots.forEach(dot => dot.classList.remove('active'))
    dots[index].classList.add('active')
  }

  if (nextBtn) {
    nextBtn.addEventListener('click', () => {
      index++
      showSlide(index)
    })
  }

  if (prevBtn) {
    prevBtn.addEventListener('click', () => {
      index--
      showSlide(index)
    })
  }

  if (dots.length) {
    dots.forEach((dot, i) => {
      dot.addEventListener('click', () => {
        index = i
        showSlide(index)
      })
    })
  }

  if (slides.length > 0) {
    setInterval(() => {
      index++
      showSlide(index)
    }, 5000)
    showSlide(index)
  }

  /***  EVENT COUNTDOWN TIMER ***/
  async function loadSchedule () {
    try {
      const response = await fetch('data/schedule.json')
      if (!response.ok)
        throw new Error(`HTTP error! Status: ${response.status}`)

      const scheduleData = await response.json()
      if (!scheduleData.events || scheduleData.events.length === 0) {
        const countdownElem = document.getElementById('countdown')
        if (countdownElem) countdownElem.innerHTML = 'No upcoming events!'
        return
      }

      const now = new Date()
      const nextEvent = scheduleData.events.find(
        event => new Date(event.date).getTime() > now.getTime()
      )

      if (!nextEvent) {
        const countdownElem = document.getElementById('countdown')
        if (countdownElem) countdownElem.innerHTML = 'No upcoming events!'
        return
      }

      const eventDate = new Date(nextEvent.date)

      function updateCountdown () {
        const now = new Date()
        const timeLeft = eventDate.getTime() - now.getTime()

        if (timeLeft <= 0) {
          const countdownElem = document.getElementById('countdown')
          if (countdownElem) countdownElem.innerHTML = 'The event has started!'
          clearInterval(countdownInterval)
          return
        }

        const days = Math.floor(timeLeft / (1000 * 60 * 60 * 24))
        const hours = Math.floor((timeLeft / (1000 * 60 * 60)) % 24)
        const minutes = Math.floor((timeLeft / (1000 * 60)) % 60)
        const seconds = Math.floor((timeLeft / 1000) % 60)

        const countdownElem = document.getElementById('countdown')
        if (countdownElem) {
          countdownElem.innerHTML = `Next Event in: ${days}d ${hours}h ${minutes}m ${seconds}s`
        }
      }

      updateCountdown()
      const countdownInterval = setInterval(updateCountdown, 1000)
    } catch (error) {
      console.error('Error fetching schedule:', error)
      const countdownElem = document.getElementById('countdown')
      if (countdownElem) countdownElem.innerHTML = 'Failed to load schedule!'
    }
  }

  loadSchedule()

  /***  RESPONSIVE MENU TOGGLE ***/
  const menuToggle = document.querySelector('.menu-toggle')
  const navLinks = document.querySelector('.nav-links')

  if (menuToggle && navLinks) {
    menuToggle.addEventListener('click', function () {
      navLinks.classList.toggle('active')
    })

    navLinks.addEventListener('click', function (event) {
      if (event.target.tagName === 'A') {
        navLinks.classList.remove('active')
      }
    })
  }

  /***  SAFELY ADD FORM EVENT LISTENERS ***/
  const bookingForm = document.getElementById('bookingForm')
  if (bookingForm) {
    bookingForm.addEventListener('submit', function (e) {
      e.preventDefault()
      const successPopup = document.getElementById('successPopup')
      if (successPopup) {
        successPopup.style.display = 'block'
        setTimeout(() => {
          successPopup.style.display = 'none'
        }, 3000)
      }
    })
  }

  const contactForm = document.getElementById('contactForm')
  if (contactForm) {
    contactForm.addEventListener('submit', function (e) {
      e.preventDefault()
      alert('Message Sent Successfully!')
    })
  }
})
