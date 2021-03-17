// hello_controller.js
import { Controller } from "stimulus"
import Rails from "@rails/ujs" 

export default class extends Controller {
    static targets = ["alert"]

    connect() {
        console.log("yeah", this.alertTarget)
    }

    markAsRead() {
       console.log( "CLICK EVENT WORKING")
       this.sendRequest()

   }
    sendRequest() {
        var taskController = this;
        Rails.ajax({
            type: "post",
            url: "/notifications/mark_as_read", 
            success: function () {
                taskController.alertTarget.classList.remove("active")
                // this.taskTarget.classList.toggle('complete');
            },
            error: function () {
               console.log("error")
            },
        })
    }
}