import QtQuick 2.3

import "rest_controller.js" as Rest

QtObject {
    id: standings

    property int __delay: 0 * 1000

    function refreshStandings(callback) {
        var timer = new Rest.Timer(standings)
        timer.interval = __delay

        timer.repeat = false

        timer.triggered.connect(function () {
            callback("[
{
\"name\": \"FRASSATTI\",
\"games\": 3,
\"wons\": 1,
\"lost\": 2,
\"score\": \"(206-210)\",
\"diff\": -4,
\"points\": 4
},
{
\"name\": \"FRASSATTI\",
\"games\": 3,
\"wons\": 1,
\"lost\": 2,
\"score\": \"(206-210)\",
\"diff\": -4,
\"points\": 4
}
]")
        })

        timer.start()
    }
}
