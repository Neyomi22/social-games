const initChatBarScroll = () => {
	const messageDom = document.getElementById('messages');
	const footerDom = document.querySelector('.footer');
	console.log('charbar');
	if (messageDom && footerDom) {
		console.log(document.scrollTop);
		// console.log(messageDom.scrollTop);
		//		messageDom.addEventListener('scroll', (el) => {
		//			console.log(el.scrollLeft, el.scrollTop);
		//		});
	}
};
export { initChatBarScroll };
