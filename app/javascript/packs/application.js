// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require('@rails/ujs').start();
require('turbolinks').start();
require('@rails/activestorage').start();
require('channels');

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import 'bootstrap';

// Internal imports
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initMapbox } from '../plugins/init_mapbox';
import { initFlatpickr } from '../plugins/init_flatpickr';
import { initSearchBar } from '../component/search_bar';
import { initChatBox } from '../live_chat/chat_box';
import { initChatBarScroll } from '../live_chat/chat_bar_scroll';
import { initNotificationCable } from '../channels/notification_channel';
import { initPhotoPicker } from '../component/photo_picker';
import 'controllers';

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
document.addEventListener('turbolinks:load', () => {
	// Call your functions here, e.g:
	// initSelect2();
	initSearchBar();
	// Fixes issue with half the map not loading due to an unknown layout issue on the show event page.
	setTimeout(() => {
		initMapbox();
	}, 50);
	initFlatpickr();
	initAutocomplete();
	initNotificationCable();
	initPhotoPicker();
	initChatBox();
	initChatBarScroll();
});
