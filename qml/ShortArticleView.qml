import QtQuick 2.0

Item {
    width: 800
    height: 600

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
        var request = new XMLHttpRequest()
        var url = "http://localhost:9080/mlb/article"

        request.onreadystatechange = function () {
            if (request.readyState === 4 && request.status === 200) {
                myFunction(request.responseText)
            } else {
                console.debug(request)
            }
        }

        request.open("GET", url, true)
        request.send()
    }

    function myFunction(json) {
        var obj = JSON.parse(json)
        console.debug(json)
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
