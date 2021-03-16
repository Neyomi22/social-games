const initPhotoPicker = () => {
	const fileUploadEl = document.querySelector('.js-photo-input');
	fileUploadEl.addEventListener('change', function (event) {
		const jsPhotoPreviewEl = document.querySelector('.js-photo-preview');
		jsPhotoPreviewEl.src = URL.createObjectURL(event.target.files[0]);
		jsPhotoPreviewEl.onload = function () {
			URL.revokeObjectURL(jsPhotoPreviewEl.src); // free memory
		};
	});
};

export { initPhotoPicker };
