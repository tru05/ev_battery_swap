let map = L.map('map').setView([19.0760, 72.8777], 6);

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: 'Map data © OpenStreetMap contributors'
}).addTo(map);

let markers = [];

function fetchStations() {
    let city = document.getElementById('city').value;
    let zip = document.getElementById('zip').value;

    let url = `http://127.0.0.1:5000/api/stations?city=${encodeURIComponent(city)}&zip=${encodeURIComponent(zip)}`;

    fetch(url)
        .then(res => res.json())
        .then(data => {
            clearMarkers();

            if (data.length === 0) {
                alert("No stations found.");
                return;
            }

            data.forEach(station => {
                let marker = L.marker([station.lat, station.lng]).addTo(map);
                marker.bindPopup(
                    `<b>${station.name}</b><br>
                    ${station.address}<br>
                    City: ${station.city}, Zip: ${station.zip_code}<br>
                    Hours: ${station.hours}<br>
                    Batteries Available: ${station.battery_available}`
                );
                markers.push(marker);
            });

            map.setView([data[0].lat, data[0].lng], 12);
        });
}

function clearMarkers() {
    markers.forEach(marker => map.removeLayer(marker));
    markers = [];
}

window.onload = fetchStations;
