const initChatBox = () => {
	const chatBoxDom = document.getElementById('messages');
	const chatHeaderDom = document.querySelector('.close-message');
	if (chatHeaderDom) {
		chatHeaderDom.addEventListener('click', () => {
			chatBoxDom.classList.toggle('toggle-visibility-chat');
		});
	}
};

export { initChatBox };
