// console.log("Hello from the console!");

const url = 'https://api.openweathermap.org/data/2.5/weather?q=London,UK&appid=bcb83c4b54aee8418983c2aff3073b3b';

fetch(url)
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok.');
        }
        return response.json();
    })
    .then(data => {
        // Modify the weather-info div content with the weather data
        const weatherInfoDiv = document.getElementById('weather-info');
        weatherInfoDiv.innerHTML = `
      <h2>Weather in ${data.name}, ${data.sys.country}</h2>
      <p>Temperature: ${data.main.temp - 273} Celcius</p>
      <p>Weather: ${data.weather[0].main}</p>
    `;
    })
    .catch(error => {
        console.error('Failure!', error);
    });

console.log('The AJAX request has been dispatched.');

