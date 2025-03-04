document.addEventListener('DOMContentLoaded', function () {
  fetchSchedule()

  document
    .getElementById('track-filter')
    .addEventListener('change', function () {
      fetchSchedule(this.value)
    })
})

function fetchSchedule (track = 'all') {
  fetch('data/schedule.json')
    .then(response => response.json())
    .then(data => {
      let scheduleContainer = document.getElementById('schedule-container')
      let timelineContainer = document.querySelector('.timeline')

      scheduleContainer.innerHTML = ''
      timelineContainer.innerHTML = ''

      let filteredEvents = data.schedule.filter(
        event => track === 'all' || event.track === track
      )

      if (filteredEvents.length === 0) {
        scheduleContainer.innerHTML = `<p>No sessions available for this track.</p>`
        return
      }

      filteredEvents.forEach(event => {
        // Dynamic Schedule Cards
        let scheduleDiv = document.createElement('div')
        scheduleDiv.classList.add('schedule-item')
        scheduleDiv.innerHTML = `
                    <p><strong>${event.time}</strong></p>
                    <p>${event.session}</p>
                    <p><em>${event.speaker}</em></p>
                    <p><strong>Track:</strong> ${event.track}</p>
                `
        scheduleContainer.appendChild(scheduleDiv)

        // Dynamic Timeline Items
        let timelineItem = document.createElement('div')
        timelineItem.classList.add('timeline-item')

        timelineItem.innerHTML = `
                    <div class="timeline-dot"></div>
                    <div class="timeline-content">
                        <h3>${event.time} - ${event.session}</h3>
                        <p><strong>Speaker:</strong> ${event.speaker}</p>
                        <p><strong>Track:</strong> ${event.track}</p>
                    </div>
                `

        timelineContainer.appendChild(timelineItem)
      })
    })
    .catch(error => console.error('Error loading schedule:', error))
}
