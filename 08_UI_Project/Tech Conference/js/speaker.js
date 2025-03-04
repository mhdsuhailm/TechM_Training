
document.addEventListener('DOMContentLoaded', function () {
  const container = document.getElementById('speakers-container')

  if (!container) {
    console.error('Error: #speakers-container not found in the HTML.')
    return
  }

  // Fetch data from the JSON file
  fetch('data/speaker.json')
    .then(response => response.json())
    .then(data => {
      data.forEach((speaker, index) => {
        const speakerCard = document.createElement('div')
        speakerCard.classList.add('speaker-card', 'fade-in')
        speakerCard.style.animationDelay = `${index * 0.2}s`

        speakerCard.innerHTML = `
          <div class="speaker-img-container">
            <img src="${speaker.image}" alt="${speaker.name}" class="speaker-img">
          </div>
          <div class="speaker-info">
            <h3 class="speaker-name">${speaker.name}</h3>
            <p class="speaker-designation">${speaker.designation}</p>
            <p class="speaker-description">${speaker.description}</p>
          </div>
        `

        container.appendChild(speakerCard)
      })
    })
    .catch(error => console.error('Error loading speakers:', error))
})
