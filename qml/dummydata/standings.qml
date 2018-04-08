import QtQuick 2.3

import "rest_controller.js" as Rest
import "FileIO.js" as File

QtObject {
    id: standings

    property int __delay: 0 * 1000

    signal error(string errorMessage)
    function refresh(callback) {
        var timer = new Rest.Timer(standings)
        timer.interval = __delay

        timer.repeat = false

        timer.triggered.connect(function () {
            File.readFile("standings.json", function (data) {
                callback(data)
            })
        })

        timer.start()
    }
}
