// app/javascript/channels/chatroom_channel.js
import consumer from './consumer';

const initNotificationCable = () => {
	const notificationsContainer = document.getElementById('notifications');
	if (notificationsContainer) {
		// let currentUserId = parseInt(notificationsContainer.dataset.notificationUser);
		consumer.subscriptions.create(
			{ channel: `NotificationChannel`, user_id: currentUserId },
			{
				received(data) {
					console.log(data); // called when data is broadcast in the cable
					notificationsContainer.insertAdjacentHTML('afterBegin', data.html);
				},
				connected() {
					console.log('connected!');
				},
				initialized() {
					console.log('initialized');
				},
				rejected() {
					console.log('rejected!');
				},
			}
		);
	}
	const notificationBell = document.getElementById('notification-bell');
	if (notificationBell) {
		// let currentUserId = parseInt(notificationBell.dataset.notificationUser);
		consumer.subscriptions.create(
			{ channel: `NotificationChannel`, user_id: currentUserId },
			{
				received(data) {
					console.log('notification-bell', notificationBell);
					notificationBell.classList.add('active');
				},
				connected() {
					// console.log('connected!');
				},
			}
		);
	}
};
export { initNotificationCable };
