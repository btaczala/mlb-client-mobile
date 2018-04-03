import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

Page {
    id: page
    width: 800
    height: 1024

    ListView {
        id: listView
        anchors.fill: parent
        orientation: Qt.Horizontal
        snapMode: ListView.SnapOneItem
        highlightFollowsCurrentItem: true
        highlightRangeMode: ListView.StrictlyEnforceRange

        model: ListModel {
            ListElement{
                league: "Major"
            }
            ListElement{
                league: "Pretendent"
            }
            ListElement{
                league: "Basic"
            }
        }

        delegate: SchedulePageDelegate {
            width: page.width
            height: page.height
            leagueName: league
        }

        onCurrentIndexChanged: {
            console.log("current index changed" + currentIndex)

            for(var count = 0; count < repeater.count; count++)
                repeater.itemAt(count).color = "white"

            repeater.itemAt(currentIndex).color = Material.primary
        }
    }

    Row {
        id: dotDotDot

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
        spacing: 5


        Repeater {
            id: repeater
            model: listView.model.count

            Rectangle {
                width: 20
                height: 20
                color: "white"
                radius: 10
                border.color: Material.primary
            }
        }
    }
}
