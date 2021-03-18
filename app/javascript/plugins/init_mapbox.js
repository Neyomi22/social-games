import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const fitMapToMarkers = (map, markers) => {
	const bounds = new mapboxgl.LngLatBounds();
	markers.forEach((marker) => bounds.extend([marker.lng, marker.lat]));
	map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const createCustomMarker = (marker) => {
  // Create a HTML element for your custom marker

  const element = document.createElement('div');
  element.className = 'marker';
  element.style.backgroundImage = `url('${marker.image_url}')`;
  element.style.backgroundSize = 'contain';
  element.style.backgroundColor = 'transparent';
  element.style.width = '25px';
  element.style.height = '25px';
  return element
}

const addMarkersToMap = (map, markers) => {
	markers.forEach((marker) => {
		const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this
    const customMarker = createCustomMarker(marker)
		new mapboxgl.Marker(customMarker)
			.setLngLat([marker.lng, marker.lat])
			.setPopup(popup) // add this
			.addTo(map);
	});
};

const initMapbox = () => {
	const mapElement = document.getElementById('map');

	if (mapElement) {
		// only build a map if there's a div#map to inject into
		mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
		const map = new mapboxgl.Map({
			container: 'map',
			style: 'mapbox://styles/neyomi22/ckma16fagf83717o03msclrwl',
		});

		const markers = JSON.parse(mapElement.dataset.markers);
		// markers.forEach((marker) => {
		// 	new mapboxgl.Marker().setLngLat([marker.lng, marker.lat]).addTo(map);
		// });

		fitMapToMarkers(map, markers);

		addMarkersToMap(map, markers);

		map.addControl(
			new MapboxGeocoder({
				accessToken: mapboxgl.accessToken,
				mapboxgl: mapboxgl,
			})
		);
	}
};

export { initMapbox };
