const initChatBarScroll = () => {
	const messageDom = document.getElementById('messages');
	const messageContainerDom = document.querySelector(
		'.message-body__container'
	);
	const footerDom = document.querySelector('.footer');
	if (messageContainerDom && messageDom && footerDom) {
		// event to prevent message box to move over footer
		// 1. get the scrollable window height
		const windowHeight =
			document.documentElement.scrollHeight - window.innerHeight;
		// 2. get footer height
		const footerHeight = footerDom.offsetHeight;
		// 3. get the window without footer height
		const remainingWindow = windowHeight - footerHeight;
		// 4. add event listener to scroll and check current scroll position
		window.addEventListener('scroll', (e) => {
			// 4 get the current scroll position
			let currentScrollPostion = window.scrollY;
			if (remainingWindow <= currentScrollPostion) {
				messageContainerDom.style.bottom = `${
					10 + currentScrollPostion - remainingWindow
				}px`;
			}
		});
	}
};
export { initChatBarScroll };
