import places from 'places.js';

// DOM
const selectTypeDom = document.getElementById('select-type');
const selectAddressDom = document.getElementById('select-address');
const selectLocationDom = document.getElementById('select-location');
const selectAutoDom = document.querySelector('.algolia-places');
const selectDateDom = document.getElementById('select-date');
const selectSportDom = document.getElementById('select-sport');

const init = () => {
	selectTypeDom.value = 'address';
	if (selectLocationDom) {
		places({ container: selectLocationDom });
	}
	changeToAddress();
};

const changeToAddress = () => {
	selectAddressDom.style.display = '';
	selectLocationDom.style.display = '';
	selectDateDom.style.display = 'none';
	selectSportDom.style.display = 'none';
};

const changeToDate = () => {
	selectAddressDom.style.display = 'none';
	selectLocationDom.style.display = 'none';
	selectDateDom.style.display = '';
	selectSportDom.style.display = 'none';
};

const changeToSport = () => {
	selectAddressDom.style.display = 'none';
	selectLocationDom.style.display = 'none';
	selectDateDom.style.display = 'none';
	selectSportDom.style.display = '';
};

const initSearchBar = () => {
	// default value when website loads
	init();

	// change input selection
	selectTypeDom.addEventListener('change', (e) => {
		if (e.target.value === 'address') {
			changeToAddress();
		} else if (e.target.value === 'sport') {
			changeToSport();
		} else if (e.target.value === 'date') {
			changeToDate();
		}
	});
};

export { initSearchBar };
