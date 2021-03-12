import places from 'places.js';

const changeToAddress = () => {
	const selectLocationDom = document.getElementById('select-location');
	document.getElementById('select-address').style.display = '';
	document.querySelector('.search-bar-div').style.display = '';
	document.getElementById('select-date').style.display = 'none';
	document.getElementById('select-sport').style.display = 'none';
	places({ container: selectLocationDom });
};

const changeToDate = () => {
	document.getElementById('select-address').style.display = 'none';
	document.querySelector('.search-bar-div').style.display = 'none';
	document.getElementById('select-date').style.display = '';
	document.getElementById('select-sport').style.display = 'none';
};

const changeToSport = () => {
	document.getElementById('select-address').style.display = 'none';
	document.querySelector('.search-bar-div').style.display = 'none';
	document.getElementById('select-date').style.display = 'none';
	document.getElementById('select-sport').style.display = '';
};

const initSearchBar = () => {
	// default value when website loads
	// init();
	// DOM
	const selectTypeDom = document.getElementById('select-type');

	changeToAddress();
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
