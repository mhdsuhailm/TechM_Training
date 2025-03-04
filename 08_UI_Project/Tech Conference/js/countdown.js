document.addEventListener('DOMContentLoaded', function () {
  fetch('data/schedule.json') 
    .then(response => response.json())
    .then(data => {
      if (!data.events || data.events.length === 0) return

      const now = new Date()
      const upcomingEvent = data.events
        .map(event => ({
          name: event.name,
          date: new Date(event.date)
        }))
        .filter(event => event.date > now)
        .sort((a, b) => a.date - b.date)[0]

      if (!upcomingEvent) return

      startCountdown(upcomingEvent.date)
    })
    .catch(error => console.error('Error loading event JSON:', error))
})

function startCountdown (eventDate) {
  function updateCountdown () {
    const now = new Date()
    const diff = eventDate - now

    if (diff <= 0) {
      updateElement('days', '00')
      updateElement('hours', '00')
      updateElement('minutes', '00')
      updateElement('seconds', '00')
      return
    }

    updateElement('days', Math.floor(diff / (1000 * 60 * 60 * 24)))
    updateElement(
      'hours',
      String(
        Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))
      ).padStart(2, '0')
    )
    updateElement(
      'minutes',
      String(Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60))).padStart(
        2,
        '0'
      )
    )
    updateElement(
      'seconds',
      String(Math.floor((diff % (1000 * 60)) / 1000)).padStart(2, '0')
    )
  }

  function updateElement (id, value) {
    const element = document.getElementById(id)
    if (element.innerText !== value) {
      element.classList.add('changing')
      setTimeout(() => {
        element.innerText = value
        element.classList.remove('changing')
      }, 200)
    }
  }

  updateCountdown()
  setInterval(updateCountdown, 1000)
}
