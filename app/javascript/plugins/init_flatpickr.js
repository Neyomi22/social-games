import flatpickr from 'flatpickr';
import 'flatpickr/dist/flatpickr.min.css';

const initFlatpickr = () => {
	flatpickr('.datepicker', {});
};

export { initFlatpickr };
