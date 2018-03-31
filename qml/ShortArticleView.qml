import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

Item {
    id: item1
    width: 800
    height: 600

    property bool fetchingData: false

    BusyIndicator {
        anchors.horizontalCenter: parent.horizontalCenter
        z: 100
        running: fetchingData
    }

    signal articleClicked(int uid)

    ListModel {
        id: model
    }

    Component.onCompleted: getData()

    ListView {
        id: articleHeadersListView
        anchors.fill: parent
        anchors.margins: 20

        model: model
        delegate: ShortArticleViewDelegate {
            width: parent.width
            height: 300

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    articleClicked(uid)
                }
            }
        }
    }

    function getData() {
        console.log("Get data")
        fetchingData = true;
        var request = new XMLHttpRequest()
        var url = "http://localhost:9080/mlb/article"

        request.onreadystatechange = function () {
            if (request.readyState === 4 && request.status === 200) {
                myFunction(request.responseText)
            } else {
                console.debug("error " + request.readyState + " " + request.status)
            }

            fetchingData = false;
        }

        request.open("GET", url, true)
        request.send()
    }

    function myFunction(json) {
        var obj = JSON.parse(json)
        for (var i = 0; i < obj.length; ++i) {
            var current = obj[i]
            articleHeadersListView.model.append({
                                                    headerContent: current.title,
                                                    postedContent: current.postedDate + " " + current.author,
                                                    textContent: current.text,
                                                    imageUrl: current.picture.url,
                                                    uid: current.id
                                                })
        }

    }
}
