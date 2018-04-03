import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

Pane {
    id: item1

    property bool fetchingData: false

    BusyIndicator {
        anchors.horizontalCenter: parent.horizontalCenter
        z: 100
        running: fetchingData
    }

    signal articleClicked(int uid)

    ListModel {
        id: model

        ListElement {
            imageUrl: "http://miastobasketu.com/gfx/zdjeciaglowne/AKADEMIABANER800.jpg"
            headerContent: "AKADEMIA BASKETU 2016/2017"
            textContent: "Jeśli jeszcze do kogoś nie dotarliśmy z koszykarskim przesłaniem, to nasze wspaniałe trenerki od miesiąca pracują już z dziećmi w ramach AKADEMII BASKETU. Zajęć z Pauliną Gajdosz i Martą Malczewską naprawdę nie trzeba zbytn [...]"
            postedContent: "2017-10-20 14:55, Michael Jordan"
            uid: 10
        }

        ListElement {
            imageUrl: "http://miastobasketu.com/gfx/zdjeciaglowne/AKADEMIABANER800.jpg"
            headerContent: "AKADEMIA BASKETU 2016/2017"
            textContent: "Jeśli jeszcze do kogoś nie dotarliśmy z koszykarskim przesłaniem, to nasze wspaniałe trenerki od miesiąca pracują już z dziećmi w ramach AKADEMII BASKETU. Zajęć z Pauliną Gajdosz i Martą Malczewską naprawdę nie trzeba zbytn [...]"
            postedContent: "2017-10-20 14:55, Michael Jordan"
            uid: 11
        }
        ListElement {
            imageUrl: "http://miastobasketu.com/gfx/zdjeciaglowne/AKADEMIABANER800.jpg"
            headerContent: "AKADEMIA BASKETU 2016/2017"
            textContent: "Jeśli jeszcze do kogoś nie dotarliśmy z koszykarskim przesłaniem, to nasze wspaniałe trenerki od miesiąca pracują już z dziećmi w ramach AKADEMII BASKETU. Zajęć z Pauliną Gajdosz i Martą Malczewską naprawdę nie trzeba zbytn [...]"
            postedContent: "2017-10-20 14:55, Michael Jordan"
            uid: 12
        }
        ListElement {
            imageUrl: "http://miastobasketu.com/gfx/zdjeciaglowne/AKADEMIABANER800.jpg"
            headerContent: "AKADEMIA BASKETU 2016/2017"
            textContent: "Jeśli jeszcze do kogoś nie dotarliśmy z koszykarskim przesłaniem, to nasze wspaniałe trenerki od miesiąca pracują już z dziećmi w ramach AKADEMII BASKETU. Zajęć z Pauliną Gajdosz i Martą Malczewską naprawdę nie trzeba zbytn [...]"
            postedContent: "2017-10-20 14:55, Michael Jordan"
            uid: 13
        }
        ListElement {
            imageUrl: "http://miastobasketu.com/gfx/zdjeciaglowne/AKADEMIABANER800.jpg"
            headerContent: "AKADEMIA BASKETU 2016/2017"
            textContent: "Jeśli jeszcze do kogoś nie dotarliśmy z koszykarskim przesłaniem, to nasze wspaniałe trenerki od miesiąca pracują już z dziećmi w ramach AKADEMII BASKETU. Zajęć z Pauliną Gajdosz i Martą Malczewską naprawdę nie trzeba zbytn [...]"
            postedContent: "2017-10-20 14:55, Michael Jordan"
            uid: 14
        }
    }

    Component.onCompleted: getData()

    ListView {
        id: articleHeadersListView
        anchors.fill: parent
        anchors.margins: 20
        spacing: 10

        onContentYChanged: {
            console.debug(articleHeadersListView.contentY)
        }

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
    }

//        console.log("Get data")
//        fetchingData = true;
//        var request = new XMLHttpRequest()
//        var url = "http://localhost:9080/mlb/article"

//        request.onreadystatechange = function () {
//            if (request.readyState === 4 && request.status === 200) {
//                myFunction(request.responseText)
//            } else {
//                console.debug("error " + request.readyState + " " + request.status)
//            }

//            fetchingData = false;
//        }

//        request.open("GET", url, true)
//        request.send()
//    }

//    function myFunction(json) {
//        var obj = JSON.parse(json)
//        for (var i = 0; i < obj.length; ++i) {
//            var current = obj[i]
//            articleHeadersListView.model.append({
//                                                    headerContent: current.title,
//                                                    postedContent: current.postedDate + " " + current.author,
//                                                    textContent: current.text,
//                                                    imageUrl: current.picture.url,
//                                                    uid: current.id
//                                                })
//        }

//    }
}
