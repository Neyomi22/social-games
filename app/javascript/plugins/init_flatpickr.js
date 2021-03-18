import flatpickr from 'flatpickr';
import 'flatpickr/dist/flatpickr.min.css';

const initFlatpickr = () => {
	flatpickr('.datepicker', {
		altInput: true,
		enableTime: true,
	});
};

export { initFlatpickr };
