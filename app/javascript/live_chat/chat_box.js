const initChatBox = () => {
	const chatBoxDom = document.querySelector('.message-icon');
	const chatContainerDom = document.querySelector('.message-body__container');
	const chatHeaderDom = document.querySelector('.close-message');
	if (chatBoxDom && chatContainerDom) {
		chatBoxDom.addEventListener('click', () => {
			chatContainerDom.style.visibility = 'visible';
		});
	}
	if (chatHeaderDom && chatContainerDom) {
		chatHeaderDom.addEventListener('click', () => {
			chatContainerDom.style.visibility = 'hidden';
		});
	}
};

export { initChatBox };
