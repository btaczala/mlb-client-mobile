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

    ListView {
        id: articleHeadersListView
        anchors.fill: parent
        anchors.margins: 20
        spacing: 10

        ScrollBar.vertical: ScrollBar {}

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
}
