
// class Notifications
//     constructor: ->
//     @notifications = $("[data-behaviour='notifications']")
//     @setup() if notifications.length > 0

//     setup: =>
//     $("[data-behavior='notifications-link]").on "click", @handleClick>
//     $.ajax(
//         url: "/notifications.json"
//         dataType: "JSON"
//         method: "GET"
//         success: @handleSuccess
//     )

//     handleClick: (e) =>
//     @.ajax(
//         url: "/notifications/mark_as_read",
//         dataType: "JSON"
//         method: "POST"
//         success: =>
//             $("[data-behavior='unread-count']").text(0)
//     )

//     handleSuccess: (data) =>
//         console.log(data)
//         items = $.map.data, (notification) =>
//         "<a class='dropdown-item' href='#{notification.url}'>#{notification.actor}#{notification.action}#{notification.notifiable.type}</a>"
        
//         $("[data-behaviour='unread-count']").text(items.length)
//         $("[data-behaviour='notification-items']").html(items)

        
//     jQuery -> 
//         new Notifications