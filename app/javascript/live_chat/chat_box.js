const initChatBox = () => {
	const chatBoxDom = document.getElementById('messages');
	const chatHeaderDom = document.querySelector('.close-message');
	if (chatHeaderDom) {
		chatHeaderDom.addEventListener('click', () => {
			chatBoxDom.classList.toggle('toggle-visibility-chat');
			if (chatBoxDom.classList.length === 0) {
				document.querySelector('.close-message').innerText = 'Close Message';
			} else {
				document.querySelector('.close-message').innerText = 'Group Message';
			}
		});
	}
};

export { initChatBox };
