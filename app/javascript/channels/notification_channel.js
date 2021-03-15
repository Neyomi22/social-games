// app/javascript/channels/chatroom_channel.js
import consumer from "./consumer";

const initNotificationCable = () => {
    console.log("initNotificationCable");
    const notificationsContainer = document.getElementById('notifications');
    if (notificationsContainer) {
        console.log(`notifications:${currentUserId}`);
        // let currentUserId = parseInt(notificationsContainer.dataset.notificationUser);
        consumer.subscriptions.create({ channel: `NotificationChannel`, user_id: currentUserId }, {
            received(data) {
                console.log(data); // called when data is broadcast in the cable
                notificationsContainer.insertAdjacentHTML('afterBegin', data.html)
            },
            connected() {
                console.log("connected!")
            },
            initialized() {
                console.log('initialized')
            },
            rejected() {
                console.log('rejected!')
            }
        });
    }
}
export { initNotificationCable };