const initChatBox = () => {
	const chatBoxDom = document.querySelector('.message-icon');
	const chatContainerDom = document.querySelector('.message-body__container');
	chatBoxDom.addEventListener('click', () => {
		chatContainerDom.style.visibility = 'visible';
	});
};

export { initChatBox };
