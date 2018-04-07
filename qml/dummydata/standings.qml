import QtQuick 2.3

import "rest_controller.js" as Rest

QtObject {
    id: standings

    property int __delay: 0 * 1000


    signal error(string errorMessage);
    function refreshStandings(callback) {
        var timer = new Rest.Timer(standings)
        timer.interval = __delay

        timer.repeat = false

        timer.triggered.connect(function () {
            var xhr = new XMLHttpRequest;
            xhr.open("GET", "standings.json");
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    var response = xhr.responseText;
                    // use file contents as required
                    callback(response)
                }
            };
            xhr.send();
            callback("");
        })

        timer.start()
    }
}
